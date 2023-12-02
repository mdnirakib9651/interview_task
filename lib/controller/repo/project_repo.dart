
import 'dart:developer';
import 'package:interview_task/controller/model/project_model.dart';
import 'package:interview_task/http_cleint/app_config.dart';
import 'api_request_handler.dart';

class ProjectRepo extends ApiRequestHandler{

  Future reqCreate({
    required String projectName,
    required String task,
    required String assignedTo,
    required String dateFrom,
    required String dateTo,
    required String status
  }) async{

    Map<String, dynamic> preams = {};
    preams['project_name'] = projectName;
    preams['task'] = task;
    preams['assigned_to'] = assignedTo;
    preams['date_form'] = dateFrom;
    preams['date_to'] = dateTo;
    preams['project_status'] = status;

    log("==@ Url: ${AppConfig.createProject}");
    log("==@ Preams: $preams");
    try{
      final res = await requestHandler.post(AppConfig.createProject, preams);
      if(res.statusCode == 200){
        //
        log("==@ Crate Preams: ${res.data}");
        log("==@ Status Code: ${res.statusCode}");

        return CreateModel.fromJson(res.data);
      } else{
        log("==@ Exception: ${res.statusCode}");
      }
    } catch(e){
      log("==@ Error in reqCreate: $e");
      rethrow;
    }
    return ;
  }

  Future reqUpdate({
    required int id,
    required String projectName,
    required String task,
    required String assignedTo,
    required String dateFrom,
    required String dateTo,
    required String status
  }) async{

    Map<String, dynamic> preams = {};
    preams['id'] = id;
    preams['project_name'] = projectName;
    preams['task'] = task;
    preams['assigned_to'] = assignedTo;
    preams['date_form'] = dateFrom;
    preams['date_to'] = dateTo;
    preams['project_status'] = status;

    log("==@ Url: ${AppConfig.createProject}");
    log("==@ Preams: $preams");
    try{
      final res = await requestHandler.post(AppConfig.updateProject, preams);
      if(res.statusCode == 200){
        //
        log("==@ Crate Preams: ${res.data}");
        log("==@ Status Code: ${res.statusCode}");

        return CreateModel.fromJson(res.data);
      } else{
        log("==@ Exception: ${res.statusCode}");
      }
    } catch(e){
      log("==@ Error in reqCreate: $e");
      rethrow;
    }
    return ;
  }

  Future reqProjectList() async{
    try{
      final res = await requestHandler.get(AppConfig.projectList);
      if(res.statusCode == 200){
        log("==@ Product List: ${res.data}");
        log("==@ Status Code: ${res.statusCode}");
        List<dynamic> data = res.data['data'];
        return data.map((item) => Create.fromJson(item)).toList();
      } else{
        log("==@ Exception: ${res.statusCode}");
      }
    } catch(e){
      log("==@ Error in reqCreate: $e");
      rethrow;
    }
  }

//
Future reqDeleteProject({
    required int id,
  }) async{

    Map<String, dynamic> preams = {};
    preams['id'] = id;

    log("==@ Url: ${AppConfig.createProject}");
    log("==@ Preams: $preams");
    try{
      final res = await requestHandler.delete(AppConfig.deleteProjectUri, preams);
      if(res.statusCode == 200){
        //
        log("==@ Crate Preams: ${res.data}");
        log("==@ Status Code: ${res.statusCode}");

        return CreateModel.fromJson(res.data);
      } else{
        log("==@ Exception: ${res.statusCode}");
      }
    } catch(e){
      log("==@ Error in reqCreate: $e");
      rethrow;
    }
    return ;
  }


}