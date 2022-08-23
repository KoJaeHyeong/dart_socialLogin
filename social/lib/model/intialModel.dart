import 'package:postgres/postgres.dart';
import 'package:social/db/connection.dart';
import 'package:social/model/loginModel.dart';

Future<LoginModel> model() async {
  var db = DB();
  await db.conn?.open();

  return LoginModel(db.conn);
}
