abstract class FirebaseClient {
  Future<void> post(
    String body,
  );

  Future <List<Map<String, dynamic>>> getAll();

  Future<void> put(
    String id,
    String body,
  );

  Future<void> delete(String id);
  
  Future<void> deleteAll();
}
