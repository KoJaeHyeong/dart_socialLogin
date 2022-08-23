import 'dart:io';
import 'package:postgres/postgres.dart';

class DB {
  PostgreSQLConnection? conn;

  DB() {
    var host = "localhost";
    var port = 5432;
    var database = "miniproject";
    var username = "kojaehyeong";
    var password = "1234";
    this.conn = PostgreSQLConnection(host, port, database, username: username, password: password);
  }
}
