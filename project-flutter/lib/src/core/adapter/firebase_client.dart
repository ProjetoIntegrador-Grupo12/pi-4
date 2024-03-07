abstract class FirebaseClient {
  Future<void> post(
    String body,
  );

  Future<Map<String, dynamic>> getAll();

  Future<void> put(
    String id,
    String body,
  );

  Future<void> delete(String id);
}
