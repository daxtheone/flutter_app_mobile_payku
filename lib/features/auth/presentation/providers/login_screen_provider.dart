// state del provider

import 'package:payku_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:payku_mobile/features/shared/shared.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:formz/formz.dart';

// Parte 3 -> StateNotifierProvider - consume afuera
final loginScreenProvider =
    StateNotifierProvider.autoDispose<LoginScreenNotifier, LoginScreenState>((
      ref,
    ) {
      final loginUserCallback = ref.watch(authProvider.notifier).loginUser;
      return LoginScreenNotifier(loginUserCallback: loginUserCallback);
    });

class LoginScreenNotifier extends StateNotifier<LoginScreenState> {
  final Function(String, String) loginUserCallback;
  LoginScreenNotifier({required this.loginUserCallback})
    : super(LoginScreenState());

  onUsernameChange(String value) {
    final newUsername = UsernameInput.dirty(value);
    state = state.copyWith(
      username: newUsername,
      isValid: Formz.validate([newUsername, state.password]),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = PasswordInput.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.username]),
    );
  }

  onFormSubmit() async {
    _touchEveryfield();
    print(state);
    if (!state.isValid) return;
    // await loginUserCallback( state.username.value, state.password.value );
    print('Llego aqui');
    state = state.copyWith(isPosting: true);
    try {
      await loginUserCallback(state.username.value, state.password.value);
    } finally {
      if (mounted) state = state.copyWith(isPosting: false);
    }
  }

  _touchEveryfield() {
    final username = UsernameInput.dirty(state.username.value);
    final password = PasswordInput.dirty(state.password.value);
    state = state.copyWith(
      isFormPosted: true,
      username: username,
      password: password,
      isValid: Formz.validate([username, password]),
    );
  }
}

class LoginScreenState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final UsernameInput username;
  final PasswordInput password;

  LoginScreenState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.username = const UsernameInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  LoginScreenState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    UsernameInput? username,
    PasswordInput? password,
  }) => LoginScreenState(
    isPosting: isPosting ?? this.isPosting,
    isFormPosted: isFormPosted ?? this.isFormPosted,
    isValid: isValid ?? this.isValid,
    username: username ?? this.username,
    password: password ?? this.password,
  );

  @override
  String toString() {
    return '''
                    LoginScreenState:
                      isPosting = $isPosting,
                      isFormPosted = $isFormPosted,
                      isValid = $isValid,
                      username = $username,
                      password = $password
                    ''';
  }
}
