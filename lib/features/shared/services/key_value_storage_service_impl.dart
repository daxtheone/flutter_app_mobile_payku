import 'package:payku_mobile/features/shared/services/key_value_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  final _prefsFuture = SharedPreferences.getInstance();


  @override
  Future<T?> getValue<T>(String key) async{
    // final prefs = await getSharedPrefs();
    final prefs = await _prefsFuture;
    switch(T){
      case int:
        return prefs.getInt(key) as T?;
      case String:
        return prefs.getString(key) as T?;
      default:
        throw UnimplementedError('Set not implemented for type ${ T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async{
    final prefs = await _prefsFuture;
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await _prefsFuture;

    switch(T){
      case int:
        prefs.setInt(key, value as int);
        break;
      case String:
        prefs.setString(key, value as String);
        break;
      default:
        throw UnimplementedError('Set not implemented for type ${ T.runtimeType}');
    }
  }
}