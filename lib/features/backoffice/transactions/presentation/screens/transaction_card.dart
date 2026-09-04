import 'package:flutter/material.dart';
import 'package:payku_mobile/features/backoffice/transactions/entities/transaction.dart';


class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(transaction.identificador, textAlign: TextAlign.center,),
        const SizedBox(height: 20),
      ],
    );
  }
}

