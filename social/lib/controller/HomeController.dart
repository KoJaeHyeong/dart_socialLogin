import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import './GoogleLogin.dart';
import '../cors.dart';

class HomeController {
  Handler get handler {
    final router = Router();

    router.get('/', (Request req) {
      return Response.ok('Hello Social', headers: cors);
    });

    router.mount('/google', GoogleController().router);

    router.all('/<ignored|.*>', (Request request) => Response.notFound('null'));

    return router;
  }
}
