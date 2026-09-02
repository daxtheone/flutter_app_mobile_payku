import 'package:payku_mobile/config/config.dart';
import 'package:dio/dio.dart';
import 'package:payku_mobile/features/auth/entities/entities.dart';
import '../../shared/shared.dart';

class AuthRepository {
  final dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
      )
  );
  Future<User> login(String username, String password) async {
    try {
      // final response = await dio.post('/users/loginApp',
      print(Environment.apiUrl);

      final response = await dio.post('/users/users/login',
          data: {
            'email': username,
            'password': password
          });
      print(response);

      final user = UserMapper.userJsonToEntity(response.data);
      print(user);
      return user;
    } on DioException catch(e){
      print('DioException [${e.type}] status: ${e.response?.statusCode}');
      print('body: ${e.response?.data}');
      print('message: ${e.message}');
      if( e.response?.statusCode == 401 ) {
        final data = e.response?.data;
        final serverMsg = data is Map ? data['message'] as String? : null;
        throw CustomError(serverMsg ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Sin conexión a internet');
      }
      throw CustomError('Error ${e.response?.statusCode ?? e.type}: ${e.message}');
    }  catch (e, stackTrace) {
      print('${e.runtimeType}: $e');
      print(stackTrace);
      rethrow;
    }
  }
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/check-status' , options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          }
      ));

      final user = UserMapper.userJsonToEntity(response.data);
      return user;

    } on DioException catch(e){
      print('checkAuthStatus DioException [${e.type}] ${e.response?.statusCode}: ${e.response?.data}');
      if( e.response?.statusCode == 401 ) {
        throw CustomError('Token no es válido' );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Sin conexión a internet');
      }
      throw CustomError('Error verificando sesión: ${e.response?.statusCode ?? e.type}');
    } catch (e, stackTrace) {
      print('checkAuthStatus ${e.runtimeType}: $e');
      print(stackTrace);
      rethrow;
    }
  }


}
