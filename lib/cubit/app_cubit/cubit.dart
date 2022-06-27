// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upload_image/cubit/app_cubit/states.dart';
import 'package:upload_image/network/end_points.dart';
import 'package:upload_image/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInistialState());
  static AppCubit get(context) => BlocProvider.of(context);
  PlatformFile? file;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    emit(AppLodingFileState());
    if (result != null) {
      file = result.files.first;
      emit(AppSuccessFileState());
    }
  }

  void uploadFile() {
    emit(AppLodingImageState());
   final file2 = File(file!.path!).readAsBytesSync();
    String base64Image = base64Encode(file2);
    print(base64Image);
    DioHelper.putData(
            url: update,
            data: {
              'name': 'ali maher 2',
              'phone': '01142595951',
              'email': 'ali8400085@gmail.com',
              'password': '12345678',
              'image':base64Image,
            },
            token:
                '4wmmxairGgNTQ845LQQnulb6QcHCvXNtVNjdyBTMShwyk8rGMPUBFopgjdJbFjPwtfsOpo')
        .then((value) {
      print(value.data.toString());
      emit(AppSuccessImageState());
    }).catchError((error) {
      print(error.data.toString());
      emit(AppErrorImageState(error));
    });
  }
}
