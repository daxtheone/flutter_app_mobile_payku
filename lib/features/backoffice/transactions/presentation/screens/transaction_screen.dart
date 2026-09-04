import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionScreen extends ConsumerStatefulWidget {
  final String identificador;
  const TransactionScreen({super.key, required this.identificador});

  @override
  TransactionScreenState createState() => TransactionScreenState();
}

class TransactionScreenState extends ConsumerState<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar prod'),
      ),
      body: Center(
        child: Text(widget.identificador),
      ),
    );
  }
}
