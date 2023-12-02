import 'dart:developer';
import 'package:get/get.dart';
import 'package:interview_task/controller/repo/project_repo.dart';
import 'package:interview_task/global/show_toast.dart';
import 'package:interview_task/http_cleint/request_handler.dart';
import '../model/project_model.dart';

class ProjectController extends GetxController implements GetxService{
  final ProjectRepo projectRepo = ProjectRepo();
  CreateModel? createModel;
  List<Create>? productList = [];

  Future create({
    required String projectName,
    required String task,
    required String assignedTo,
    required String dateFrom,
    required String dateTo,
    required String status
  }) async{
    try{
      final response = await projectRepo.reqCreate(
          projectName: projectName,
          task: task,
          assignedTo: assignedTo,
          dateFrom: dateFrom,
          dateTo: dateTo,
          status: status
      );
      createModel = response;
      log("==@ Crate Data: $response");
      showToast("Project added successfully!!");
      Get.back();
      update();
    } catch(e, s){
      if(e is RequestException){
        e.handleError(defaultMessage: 'Error! Create failed!');
      } else {
        log('#errorUnknown', error: e, stackTrace: s);
      }
    }
  }

  Future<List<Create>?> fetchProduct() async{
    try{
      final response = await projectRepo.reqProjectList();
      productList = response;
      log("==@ Product List Con: $response");
      update();
    } catch(e, s){
      if(e is RequestException){
        e.handleError(defaultMessage: 'Error! Comments fetch failed!');
      } else {
        log('#errorUnknown', error: e, stackTrace: s);
      }
    }
    return productList;
  }

  Future updateProduct({
    required int id,
    required String projectName,
    required String task,
    required String assignedTo,
    required String dateFrom,
    required String dateTo,
    required String status
  }) async{
    try{
      final response = await projectRepo.reqUpdate(
        id: id,
          projectName: projectName,
          task: task,
          assignedTo: assignedTo,
          dateFrom: dateFrom,
          dateTo: dateTo,
          status: status
      );
      createModel = response;
      log("==@ Update Data: $response");
      showToast("Project Update successfully!!");
      await fetchProduct();
      Get.back();
      update();
    } catch(e, s){
      if(e is RequestException){
        e.handleError(defaultMessage: 'Error! Create failed!');
      } else {
        log('#errorUnknown', error: e, stackTrace: s);
      }
    }
  }

  // 
  Future delteProject({
    required int id,
  }) async{
    try{
      final response = await projectRepo.reqDeleteProject(
          id: id,
      );
      createModel = response;
      log("==@ Update Data: $response");
      showToast("Project Delete successfully!!");
      await fetchProduct();
      update();

    } catch(e, s){
      if(e is RequestException){
        e.handleError(defaultMessage: 'Error! Create failed!');
      } else {
        log('#errorUnknown', error: e, stackTrace: s);
      }
    }
  }

}
