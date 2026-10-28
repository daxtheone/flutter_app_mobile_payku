

class Transaction {
  String identificador;
  String concepto;
  /*String estatus;
  String ordencompra;

  String monto;*/
  Transaction({
    required this.identificador,
    required this.concepto,
    /*
    required this.estatus,
    required this.order,

    required this.monto,

     */
  });
}

class TransactionMapper {
  static Transaction jsonToEntity(Map<String, dynamic> json) => Transaction(
      identificador: json['identificador'],
      concepto: json['concepto'],
    /*  estatus: json['estatus'],
      //price: double.parse(json['price'].toString()),
      order: json['order'],
      monto: json['monto'],*/
  );
}