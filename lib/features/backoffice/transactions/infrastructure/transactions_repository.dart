

import 'package:dio/dio.dart';
import 'package:payku_mobile/features/backoffice/transactions/entities/transaction.dart';
import '../../../../config/config.dart';

class TransactionsRepository {

  final String accessToken;
  late final Dio dio;

  TransactionsRepository({required this.accessToken}): dio = Dio(BaseOptions(baseUrl: Environment.apiUrl,headers: {
    'Authorization': 'Bearer $accessToken'
  }));


  Future<List<Transaction>> getTransactionsByPage({int limit = 20, int offset = 0}) async {
    final response = await dio.get('/users/transactions/transactions-list?limit=$limit&offset=$offset');
    final List data = response.data['data'] ?? [];
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

