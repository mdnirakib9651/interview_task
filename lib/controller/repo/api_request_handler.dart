import 'package:get/get.dart';
import '../../http_cleint/request_handler.dart';

abstract class ApiRequestHandler {
  final requestHandler = Get.find<RequestHandler>();
}
