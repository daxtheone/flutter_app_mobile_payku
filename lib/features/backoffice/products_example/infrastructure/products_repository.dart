/*
import 'package:app_payku_base_v_0_1/config/config.dart';
import 'package:app_payku_base_v_0_1/features/backoffice/products/entities/product.dart';
import 'package:dio/dio.dart';

class ProductsRepository {

  final String accessToken;
  late final Dio dio;
  ProductsRepository({required this.accessToken}): dio = Dio(BaseOptions(baseUrl: Environment.apiUrl,headers: {
    'Authorization': 'Bearer $accessToken'
  }));

  Future<List<Product>> getProductsByPage({int limit = 3, int offset = 0}) async {
    final response = await dio.get<List>('/products?limit=$limit&offset=$offset');
    final List<Product> products = [];
    for (final product in response.data ?? [] ){
      products.add(ProductMapper.jsonToEntity(product));
    }
    return products;
  }
  Future<Product> getProductById(String id) async{
    throw UnimplementedError();
  }
}

*/