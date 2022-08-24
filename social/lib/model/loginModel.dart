import 'package:postgres/postgres.dart';
import 'dart:core';

class LoginModel {
  PostgreSQLConnection? conn;
  String? table;
  var result;

  LoginModel(conn) {
    this.conn = conn;
    this.table = 'users';
  }

  signUp(String name, String email, String password, String phone) async {
    var userInfo = await findOne(email);
    print('userInfo ::$userInfo');
    if (userInfo.length > 0) {
      result = '이미 존재하는 회원입니다.';
    } else {
      var query = await this.conn!.query('''
      insert into social.users (name, email , password, phone) 
      values ('$name' ,'$email', '$password', '$phone')
      ''');
      result = '회원가입이 완료되었습니다';
    }
    print('result :: $result');
    return result;
  }

  findOne(String email) async {
    List<Map<String, dynamic>> list = [];
    result = await this.conn!.query('''
        select * from social.users where email = '$email'
      ''');
    for (final row in result) {
      list.add({
        "id": row[0],
        "name": row[1],
        "email": row[2],
        "password": row[3],
        "phone": row[4],
        "created_At": row[5],
      });
    }
    print(list);
    return list;
  }

  login(String email, String password) async {
    var query = await this.conn!.query('''
        select * from social.users where email = '$email' and password = '$password'
      ''');

    if (query.isNotEmpty) {
      result = '로그인 완료';
    } else {
      result = '로그인 실패';
    }

    return result;
  }
}
