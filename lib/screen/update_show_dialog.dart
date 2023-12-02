
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/screen/search_screen.dart';
import '../controller/model/project_model.dart';
import '../controller/project_controller/project_controller.dart';
import '../global/custom_dropdown_field.dart';
import '../global/custom_text_filed.dart';
import '../global/datetime_formatter.dart';
import '../global/show_date_picker.dart';

class ShowUpdateProduct extends StatefulWidget {
  final Create create;
  const ShowUpdateProduct({super.key, required this.create});

  @override
  State<ShowUpdateProduct> createState() => _ShowUpdateProductState();
}

class _ShowUpdateProductState extends State<ShowUpdateProduct> {

  TextEditingController projectCon = TextEditingController();
  TextEditingController taskCon = TextEditingController();
  TextEditingController dateFromCon = TextEditingController();
  TextEditingController dateToCon = TextEditingController();
  String status = "";
  String assign = "";

  int? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    projectCon.text = widget.create.projectname;
    taskCon.text = widget.create.task;
    dateFromCon.text = widget.create.dateForm;
    dateToCon.text = widget.create.dateTo;
    status = widget.create.projectStatus;
    assign = widget.create.assignedTo;
    id = widget.create.id;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectController>(builder: (controller) {
      return AlertDialog(
        elevation: 0,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // title: const Text('Timesheet Entries'),
        scrollable: true,
        content: Builder(builder: (context) {
          // var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Container(
            width: width - 50,
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 20),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Timesheet Entries",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text("Project",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: projectCon,
                          isDense: true,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text("Task",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: taskCon,
                          isDense: true,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Text("Date From",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                  controller: dateFromCon,
                                  sufixIcon: IconButton(
                                    splashRadius: 0.1,
                                    icon: const Icon(Icons.calendar_month),
                                    onPressed: () async {
                                      DateTime selectedDate = await datePickerDialog(context);
                                      log(DateTimeFormatter.showDateOnlyYear.format(DateTime.parse(selectedDate.toString())));
                                      setState(() {
                                        dateFromCon.text = DateTimeFormatter.showDateOnlyYear.format(
                                            DateTime.parse(selectedDate.toString())
                                        );
                                      });
                                    },
                                  )
                              ),)
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                              width: 50,
                              child: Center(
                                child: Text("Date To",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                  controller: dateToCon,
                                  sufixIcon: IconButton(
                                    splashRadius: 0.1,
                                    icon: const Icon(Icons.calendar_month),
                                    onPressed: () async {
                                      DateTime selectedDate = await datePickerDialog(context);
                                      log(DateTimeFormatter.showDateOnlyYear.format(DateTime.parse(selectedDate.toString())));
                                      setState(() {
                                        dateToCon.text = DateTimeFormatter.showDateOnlyYear.format(
                                            DateTime.parse(selectedDate.toString())
                                        );
                                      });
                                    },
                                  )
                              ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text("Status",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomDropDownFormField(
                            value: status,
                            decoration: inputDecoration,
                            isDense: true,
                            items: const [
                              "",
                              "Open",
                              "In Progress",
                              "Closed",
                            ],
                            sufixIcon: const Icon(
                                Icons.keyboard_arrow_down_sharp),
                            onChanged: (val) {
                              setState(() {
                                status = val!;
                                log("SetState Change: $status");
                              });

                            }
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text("Assign To",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomDropDownFormField(
                            value: assign,
                            decoration: inputDecoration,
                            isDense: true,
                            items: const [
                              "",
                              "Red",
                              "White",
                              "Blue",
                            ],
                            sufixIcon: const Icon(
                                Icons.keyboard_arrow_down_sharp),
                            onChanged: (val) {
                              setState(() {
                                assign = val!;
                                log("SetState Change: $assign");
                              });

                            }
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async{
                          await Get.showOverlay(
                              loadingWidget: const OverlayLoadingIndicator(),
                              asyncFunction: ()async{
                                await controller.updateProduct(
                                    id: id!,
                                    projectName: projectCon.text.trim(),
                                    task: taskCon.text.trim(),
                                    assignedTo: assign.toString(),
                                    dateFrom: dateFromCon.text.trim(),
                                    dateTo: dateToCon.text.trim(),
                                    status: status.toString()
                                );
                              }
                          );
                        },
                        child: const Text("Update"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
