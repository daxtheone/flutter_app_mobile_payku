

import 'package:dio/dio.dart';
import 'package:payku_mobile/features/backoffice/transactions/entities/transaction.dart';
import '../../../../config/config.dart';

class TransactionsRepository {

  final String accessToken;
  late final Dio dio;
  TransactionsRepository({required this.accessToken}): dio = Dio(BaseOptions(baseUrl: Environment.apiUrl,headers: {
    'Authorization': 'Bearer $accessToken'
  }));

  Future<List<Transaction>> getTransactionsByPage({int limit = 3, int offset = 0}) async {

    // final response = await dio.get<List>('/transactions?limit=$limit&offset=$offset');
    final response = await dio.get('/users/users/login2');
    final List data = response.data['user'] ?? [];
    final List<Transaction> transactions = [];
    for (final transaction in data ){
      transactions.add(TransactionMapper.jsonToEntity(transaction));
    }
    return transactions;
  }
  Future<Transaction> getTransactionsById(String id) async{
    throw UnimplementedError();
  }
}

