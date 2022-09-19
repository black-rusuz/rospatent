abstract class ISearchApi {
  abstract final String url;

  Future<void> search(String data);
}
