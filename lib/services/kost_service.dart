import 'package:dio/dio.dart';
import 'package:hunian_app/core/network/dio_client.dart';
import 'package:hunian_app/models/kost_model.dart';

class KostService {
  static final KostService _instance = KostService._internal();
  factory KostService() => _instance;
  KostService._internal();

  final Dio _dio = DioClient().dio;

  // Get kosts
  Future<List<KostModel>> getKosts() async {
    try {
      final response = await _dio.get('kost');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => KostModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal mengambil data kost');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get kosts by city
  Future<List<KostModel>> getKostsByCity(String city) async {
    try {
      final response = await _dio.get('kost', queryParameters: {'city': city});

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => KostModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal mengambil data kost');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get detail kost by ID
  Future<KostModel> getKostById(String id) async {
    try {
      final response = await _dio.get('kost/$id');

      if (response.statusCode == 200) {
        return KostModel.fromJson(response.data);
      } else {
        throw Exception('Gagal mengambil detail kost');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
