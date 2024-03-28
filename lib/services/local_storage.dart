import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage() {
    init();
  }

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences? _prefs;

  Future<void> saveData(String key, String value) async {
    // save data to local storage
    await _prefs!.setString(key, value);
  }

  Future<Either<Null, String>> getData(String key) async {
    // get data from local storage
    final data = _prefs!.getString(key);
    if (data != null) {
      return Right(data);
    } else {
      return const Left(null);
    }
  }

  Future<void> removeData(String key) async {
    // remove data from local storage
    await _prefs!.remove(key);
  }
}
