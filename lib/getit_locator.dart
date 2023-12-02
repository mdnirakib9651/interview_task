//
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_task/controller/project_controller/project_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http_cleint/api_clients.dart';
import 'http_cleint/request_handler.dart';
import 'preferences/shared_prefs.dart';

final locator =  GetIt.instance;

Future init(SharedPreferences prefs) async {
  ApiClients.updateHeader(prefs: prefs);

  locator.registerLazySingleton<MyPrefs>(()=> MyPrefs());
  locator.registerLazySingleton<RequestHandler>(()=> RequestHandler(dio: Dio()));

  Get.put(RequestHandler(dio: Dio()));
  Get.put(ProjectController());

  //
  Get.lazyPut(() => RequestHandler(dio: Dio()));
}
