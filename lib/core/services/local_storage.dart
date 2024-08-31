import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty_app/core/model/task_model.dart';

class AppLocalStorage {
  static String kIsUpLoad = 'isUpload';
  static String kIsDarkMode = 'isDarkMode';
  static String kName = 'name';
  static String kImage = 'image';

  static late Box userBox;
  static late Box<TaskModel> taskBox;

  static init() {
    userBox = Hive.box('userBox');
    taskBox = Hive.box('tasksBox');
  }

  static cacheData(String key, value) {
    userBox.put(key, value);
  }

  static getCacheData(String key) {
    return userBox.get(key);
  }

  static cacheTaskData(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getCachedTaskData(String key) {
    return taskBox.get(key);
  }
}
