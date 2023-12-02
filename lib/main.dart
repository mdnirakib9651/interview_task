
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/preferences/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'getit_locator.dart';
import 'screen/search_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await init(prefs);
  await locator<MyPrefs>().initSharePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchScreen(),
    );
  }
}
