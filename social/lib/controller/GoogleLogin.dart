import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:social/model/intialModel.dart';
import '../cors.dart';

class GoogleController {
  Router get router {
    final router = Router();

    router.get('/', (Request req) {
      return Response.ok('Google Login', headers: cors);
    });

    router.post('/signUp', (Request req) async {
      var loginModel = await model();
      var param = await req.readAsString();
      var userInfo = jsonDecode(param);

      var name = userInfo['name'];
      var email = userInfo['email'];
      var password = userInfo['password'];
      var phone = userInfo['phone'];

      var result = await loginModel.signUp(name, email, password, phone);
      print('queryResult : $result');
      return Response.ok(jsonEncode(result), headers: cors);
    });

    router.post('/login', (Request req) async {
      var loginModel = await model();
      var param = await req.readAsString();
      print(param);
      var body = jsonDecode(param);
      var email = body['email'];
      var password = body['password'];

      var result = await loginModel.login(email, password);
      print('result ::$result');
      return Response.ok(result, headers: cors);
    });

    router.post('/socialLogin', (Request req) async {
      var loginModel = await model();
      var param = req.readAsString();

      Response.ok('소셜로그인', headers: cors);
    });

    return router;
  }
}
