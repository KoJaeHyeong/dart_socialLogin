import 'package:postgres/postgres.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'dart:io' show Platform;
import 'package:social/controller/homeController.dart';
import 'package:social/db/connection.dart';
import 'package:social/service/authService.dart';

void main() async {
  var PORT = 7777;
  // var connection = PostgreSQLConnection("localhost", 5432, "miniproject", username: "kojaehyeong", password: "1234");
  // await connection.open();
  var db = DB();
  await db.conn?.open();
  print('DB연결 :: $db');
  final home = HomeController();
  final server = await shelf_io.serve(home.handler, '0.0.0.0', PORT);

  print('☀️ Server running on localhost:${server.port} ☀️');
}
