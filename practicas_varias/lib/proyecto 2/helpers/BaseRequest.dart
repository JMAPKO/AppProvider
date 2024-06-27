abstract class BaseRequest<T>{
  Future<T> execute();
}