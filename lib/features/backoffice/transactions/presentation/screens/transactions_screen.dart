import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:payku_mobile/features/backoffice/transactions/presentation/providers/transactions_provider.dart';
import 'package:payku_mobile/features/backoffice/transactions/presentation/screens/transaction_card.dart';


class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  TransactionsScreenState createState() => TransactionsScreenState();
}

class TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 400) >=
          scrollController.position.maxScrollExtent) {
        ref.read(transactionsProvider2.notifier).loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //  scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionsState = ref.watch(transactionsProvider2);

    return Column(
      children: [
        SizedBox(height: 100, child: Container()),
        Center(child: Text('SCREEEN DE transacciones nuevo')),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: transactionsState.transactions.length,
            itemBuilder: (context, index) {
              final item = transactionsState.transactions[index];
              print(item);
              return GestureDetector(
                  onTap: (){
                    context.push('/product/${item.identificador}');
                  },
                  child: TransactionCard(transaction: item));
              // return ListTile(key: ValueKey(item.identificador), title: Text(item.order));
            },
          ),
        ),
      ],
    );
  }
}
