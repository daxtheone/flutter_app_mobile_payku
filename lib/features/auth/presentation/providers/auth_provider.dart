import 'package:payku_mobile/config/constants/environment.dart';
import 'package:payku_mobile/features/auth/entities/entities.dart';
import 'package:payku_mobile/features/shared/services/key_value_storage_service.dart';
import 'package:payku_mobile/features/shared/widgets/widgets.dart';
import 'package:payku_mobile/features/auth/infrastructure/auth_repository.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:payku_mobile/features/shared/services/services.dart';


final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref){
  final authRepository = AuthRepository();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
      authRepository: authRepository,
      keyValueStorageService:keyValueStorageService
  );
});

class AuthNotifier extends StateNotifier<AuthState>{
  AuthNotifier({
    required this.authRepository, required this.keyValueStorageService
  }): super( AuthState() ){
    checkAuthStatus();
  }
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  Future<void> loginUser( String username, String password) async {
    // temporalmente
    await Future.delayed(const Duration(milliseconds: 500));
    print('probando aqui');
    try {
      final user = await authRepository.login(username, password);
      await _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    }  catch (e, stackTrace) {
      print('${e.runtimeType}: $e');
      print(stackTrace);
      logout('Error no controlado: $e');

    }

  }

  void checkAuthStatus() async{
    final token = await keyValueStorageService.getValue<String>(Environment.tokenKey);
    if (token == null) return logout();
    try {
      final user = await authRepository.checkAuthStatus(token);
      await _setLoggedUser(user);
    } catch  (e, stackTrace) {
      print('checkAuthStatus ${e.runtimeType}: $e');
      print(stackTrace);
      logout();
    }
  }

  Future<void> logout([String? errorMessage]) async{
    await keyValueStorageService.removeKey(Environment.tokenKey);
    state = AuthState(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage ?? '',
    );
  }

  Future<void> _setLoggedUser(User user) async{
    // Todo: necesitamos guardar el token fisicamente en el movil
    await keyValueStorageService.setKeyValue(Environment.tokenKey, user.token);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );


  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) => AuthState(
    authStatus: authStatus ?? this.authStatus,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}
