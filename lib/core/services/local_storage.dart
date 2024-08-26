import 'package:hive_flutter/hive_flutter.dart';

class AppLocalStorage {

 static String kIsUpLoad = 'isUpload';
 static String kName = 'name';
 static String kImage= 'image';


  static late Box userBox;
  static init() {
    userBox = Hive.box('userBox');
  }

  static cacheData(String key, value) {
    userBox.put(key, value);
  }

  static getCacheData(String key) {
    return userBox.get(key);
  }
}
