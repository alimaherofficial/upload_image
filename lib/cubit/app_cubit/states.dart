abstract class AppStates {}

class AppInistialState extends AppStates {}

class AppLodingFileState extends AppStates {}

class AppSuccessFileState extends AppStates {}

class AppLodingImageState extends AppStates {}

class AppSuccessImageState extends AppStates {}

class AppErrorImageState extends AppStates {
  final String error;
  AppErrorImageState(this.error);
}
