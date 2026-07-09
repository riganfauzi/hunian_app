import 'package:dio/dio.dart';
import 'package:hunian_app/core/network/dio_client.dart';
import 'package:hunian_app/models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final Dio _dio = DioClient().dio;

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.get(
        'users',
        queryParameters: {'email': email},
      );

      if (response.statusCode != 200) {
        throw Exception('Gagal menghubungi server');
      }

      final List<dynamic> data = response.data;

      if (data.isEmpty) {
        throw Exception('Email atau password salah');
      }

      final matched = data
          .map((json) => UserModel.fromJson(json))
          .where(
            (user) =>
                user.email.toLowerCase() == email.toLowerCase() &&
                user.password == password,
          )
          .toList();

      if (matched.isEmpty) {
        throw Exception('Email atau password salah');
      }

      return matched.first;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      rethrow;
    }
  }
}
