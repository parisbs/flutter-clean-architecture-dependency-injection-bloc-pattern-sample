import 'package:async/async.dart';

extension FutureResult<T> on Future<Result<T>> {
  Future<Result<R>> map<R>(R Function(T data) transform) {
    return then((result) => result.map(transform));
  }
}

extension ResultExtensions<T> on Result<T> {
  static Result<T> runCatching<T>(T Function() fn) {
    try {
      return ValueResult(fn());
    } catch (e) {
      return ErrorResult(e);
    }
  }

  Result<R> map<R>(R Function(T data) transform) {
    if (isValue) {
      return ValueResult(transform(asValue!.value));
    } else {
      return ErrorResult(asError!.error);
    }
  }

  Result<R> mapCatching<R>(R Function(T data) transform) {
    if (isValue) {
      return runCatching(() => transform(asValue!.value));
    } else {
      return ErrorResult(asError!.error);
    }
  }
}
