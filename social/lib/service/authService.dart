import 'package:postgres/postgres.dart';

class AuthService {
  PostgreSQLConnection? conn;
  String? table;

  AuthService(conn) {
    this.conn = conn;
    this.table = 'login';
  }
}
