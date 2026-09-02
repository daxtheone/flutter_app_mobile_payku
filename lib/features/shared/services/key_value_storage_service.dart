abstract class KeyValueStorageService {
  // La T significa que recibe  un dato generico, si recibe int, lo trata como int
  Future<void> setKeyValue<T>(String key, T value);
  Future<T?> getValue<T>(String key);
  Future<bool> removeKey( String key );
}