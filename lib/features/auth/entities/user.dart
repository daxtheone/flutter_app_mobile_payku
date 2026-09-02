import 'dart:ffi';

class User {
  final String identificadorUsuario;
  final String email;
  final String identificadorCuenta;
  final String nombre;
  final String rut;
  final String razonsocial;
  final String nombrefantasia;
  final String logo;
  final String idioma;
  final String moneda;
  // final List<String> permiso;
  final String token;

  User({
    required this.identificadorUsuario,
    required this.email,
    required this.identificadorCuenta,
    required this.nombre,
    required this.rut,
    required this.razonsocial,
    required this.nombrefantasia,
    required this.logo,
    required this.idioma,
    required this.moneda,
    // required this.permiso,
    required this.token,
  });
/*
  bool get isAdmin {
    return permiso.contains('admin');
  }
  */
}

class UserMapper {
  static User userJsonToEntity(Map<String,dynamic> json) => User(
      identificadorUsuario: json['user']['usuario']['identificador'],
      email: json['user']['usuario']['email'],
      identificadorCuenta: json['user']['cuenta']['identificador'],
      nombre: '${json['user']['cuenta']['nombre']} ${json['user']['cuenta']['apellido']}',
      rut: json['user']['cuenta']['rut'],
      razonsocial: json['user']['cuenta']['razonsocial'],
      nombrefantasia: json['user']['cuenta']['nombrefantasia'],
      logo: json['user']['cuenta']['logo'],
      idioma: json['user']['cuenta']['idioma'].toString(),
      moneda: json['user']['cuenta']['moneda'],
      // permiso: List<String>.from(json['permiso'].map((permiso)=>permiso)),
      token: json['token']
  );
}