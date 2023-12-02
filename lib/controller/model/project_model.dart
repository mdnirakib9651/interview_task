
class CreateModel {
  CreateModel({
    required this.status,
    required this.code,
  });
  late final String status;
  late final String code;

  CreateModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    return _data;
  }
}

class ProjectModel {
  ProjectModel({
    required this.status,
    required this.code,
    required this.data,
  });
  late final String status;
  late final String code;
  late final List<Create> data;

  ProjectModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    code = json['code'];
    data = List.from(json['data']).map((e)=>Create.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Create {
  Create({
    required this.id,
    required this.projectname,
    required this.task,
    required this.assignedTo,
    required this.dateForm,
    required this.dateTo,
    required this.projectStatus,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String projectname;
  late final String task;
  late final String assignedTo;
  late final String dateForm;
  late final String dateTo;
  late final String projectStatus;
  late final String createdAt;
  late final String? updatedAt;
  late final String? deletedAt;

  Create.fromJson(Map<String, dynamic> json){
    id = json['id'];
    projectname = json['projectname'];
    task = json['task'];
    assignedTo = json['assigned_to'];
    dateForm = json['date_form'];
    dateTo = json['date_to'];
    projectStatus = json['project_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['projectname'] = projectname;
    data['task'] = task;
    data['assigned_to'] = assignedTo;
    data['date_form'] = dateForm;
    data['date_to'] = dateTo;
    data['project_status'] = projectStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}