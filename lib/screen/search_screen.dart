

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/controller/project_controller/project_controller.dart';
import 'package:interview_task/global/custom_text_filed.dart';
import 'package:intl/intl.dart';
import '../controller/model/project_model.dart';
import 'create_show_dialog.dart';
import 'update_show_dialog.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController taskCon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProjectController>().fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GetBuilder<ProjectController>(
      builder: (projectCon) {
        List<Create>? filteredList = projectCon.productList
            ?.where((item) => item.projectname.toLowerCase().contains(
            taskCon.text.toLowerCase())
        ).toList();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  return true;
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text("Timesheet Entries",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: Colors.black)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                                width: 50,
                                child: Center(
                                  child: Text("Task",
                                    style: TextStyle(
                                        fontSize: 16,
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
                                  onChange: (val){
                                    setState(() {
                                      filteredList = projectCon.productList?.where((item) =>
                                          item.projectname.toLowerCase().contains(
                                              taskCon.text.toLowerCase())).toList();
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      filteredList = projectCon.productList?.where((item) =>
                                          item.projectname.toLowerCase().contains(
                                              taskCon.text.toLowerCase())).toList();
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    maximumSize: Size(size.width, 40),
                                    minimumSize: Size(size.width, 40),
                                  ),
                                  child: const Text("Search",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // _showMyDialog(context);
                                    showDialog(
                                        context: context,
                                        builder: (context){
                                          return const CreateProduct();
                                        }
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    maximumSize: Size(size.width, 40),
                                    minimumSize: Size(size.width, 40),
                                  ),
                                  child: const Text("Create",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: size.width,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.black)
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text("Project",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text("Task",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text("Assigned To",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text("From",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text("To",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text("Status",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text("",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    projectCon.productList!.isNotEmpty  || filteredList!.isEmpty ?
                    filteredList!.isNotEmpty
                        ? RefreshIndicator(
                      onRefresh: ()async{
                        projectCon.fetchProduct();
                      },
                      child: ListView.builder(
                          itemCount: filteredList?.length,
                          padding: const EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            var product = filteredList?[index];
                            return Container(
                              height: 60,
                              width: size.width,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.black)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(product?.projectname ?? "",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(product?.task ?? "",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(product?.assignedTo ?? "",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Text(DateFormat("dd-MM-yyyy").format(DateTime.parse("${product?.dateForm}")),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Text(DateFormat("dd-MM-yyyy").format(DateTime.parse("${product?.dateTo}")),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Text(product?.projectStatus ?? "",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 50,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx){
                                                      return ShowUpdateProduct(create: filteredList![index],);
                                                    }
                                                );
                                              },
                                              child: const Icon(
                                                  Icons.edit_note_outlined,
                                                  color: Colors.black,
                                                  size: 20
                                              )
                                          ),
                                          const SizedBox(width: 5),
                                          GestureDetector(
                                              onTap: () async {
                                              await Get.showOverlay(
                                              loadingWidget:
                                                const OverlayLoadingIndicator(), 
                                                  asyncFunction: () async {
                                                  projectCon.delteProject(id: product!.id);
                                                  log("deleting => ${product.id.toString()}");
                                                  }
                                                );                                               
                                                },
                                              child: const Icon(
                                                  Icons.delete_outline_outlined,
                                                  color: Colors.black,
                                                  size: 20
                                              )
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                    ) : RefreshIndicator(
                      onRefresh: ()async{
                        projectCon.fetchProduct();
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 0.5, color: Colors.black)
                              ),
                                child: const Center(child: Text("No Data Found"),)),
                          ],
                        ),
                      ),
                    )
                    : const Center(child: CircularProgressIndicator(),),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OverlayLoadingIndicator extends StatelessWidget {
  const OverlayLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black26,
      child: Center(
        child: Container(
          height: 125,
          width: 120,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularProgressIndicator(),
              Text("Loading..."),
            ],
          ),
        ),
      ),
    );
  }
}