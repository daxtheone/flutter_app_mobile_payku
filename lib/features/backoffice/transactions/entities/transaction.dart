

class Transaction {
  String identificador;
 /* String estatus;
  String order;
  String concepto;
  String monto;
*/
  Transaction({
    required this.identificador,
    /*
    required this.estatus,
    required this.order,
    required this.concepto,
    required this.monto,

     */
  });
}

class TransactionMapper {
  static Transaction jsonToEntity(Map<String, dynamic> json) => Transaction(
      identificador: json['identificador'],
    /*  estatus: json['estatus'],
      //price: double.parse(json['price'].toString()),
      order: json['order'],
      concepto: json['concepto'],
      monto: json['monto'],*/
  );
}