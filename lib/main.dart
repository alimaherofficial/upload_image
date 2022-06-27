import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upload_image/cubit/BlocObserver.dart';
import 'package:upload_image/modules/home_screen.dart';
import 'package:upload_image/network/remote/dio_helper.dart';
import 'package:upload_image/styles/colors/colors.dart';

void main() {
  DioHelper.init();
 BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appColor,
      ),
      home: const HomeScreen(),
    );
  }
}
