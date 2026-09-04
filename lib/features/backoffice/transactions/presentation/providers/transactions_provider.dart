


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:payku_mobile/features/auth/presentation/providers/auth_provider.dart';
import 'package:payku_mobile/features/backoffice/transactions/entities/transaction.dart';
import 'package:payku_mobile/features/backoffice/transactions/infrastructure/transactions_repository.dart';

final transactionsProvider1 = Provider<TransactionsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';
  final transactionsRepository = TransactionsRepository(accessToken:accessToken);
  return transactionsRepository;
});

// StateNotifierProvider


// 3er paso el provider

final transactionsProvider2 = StateNotifierProvider<TransactionsNotifier, TransactionsState>((ref){
  final transactionsRepository = ref.watch(transactionsProvider1);
  return TransactionsNotifier(transactionsRepository: transactionsRepository);
});

// 1 STATE
class TransactionsState {
  final bool isLastPage;
  final int limit;
  final int offset;
  final bool isLoading;
  final List<Transaction> transactions;

  TransactionsState({
    this.isLastPage = false,
    this.limit = 10,
    this.offset = 0,
    this.isLoading = false,
    this.transactions = const []
  });

  TransactionsState copyWith({
    bool? isLastPage,
    int? limit,
    int? offset,
    bool? isLoading,
    List<Transaction>? transactions
  }) => TransactionsState(
      isLastPage: isLastPage ?? this.isLastPage,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      isLoading: isLoading ?? this.isLoading,
      transactions: transactions ?? this.transactions
  );
}

// 2 ) Notifier

class TransactionsNotifier extends StateNotifier<TransactionsState> {
  final TransactionsRepository transactionsRepository;
  TransactionsNotifier({
    required this.transactionsRepository
  }):super(TransactionsState()){
    loadNextPage();
  }
  Future loadNextPage() async {
    if(state.isLoading || state.isLastPage) return;
    state = state.copyWith(
        isLoading: true
    );
    final transactions = await transactionsRepository.getTransactionsByPage(limit: state.limit, offset: state.offset);
    if (transactions.isEmpty) {
      state = state.copyWith(
          isLoading: false,
          isLastPage: true
      );
      return;
    }
    state = state.copyWith(
        isLastPage: false,
        isLoading: false,
        offset: state.offset + state.limit,
        transactions: [...state.transactions, ...transactions]
    );

  }
}








