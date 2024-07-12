abstract class UseCaseStream<Type, Params> {
  Stream<Type> listen(Params params);
}
