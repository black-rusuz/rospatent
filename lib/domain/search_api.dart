abstract class SearchApi {
  abstract final String url;

  Future<void> search(String data);
}
