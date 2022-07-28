class HttpError implements Exception {
  const HttpError({
    required this.message,
    this.code = -1,
    this.stackTrace
  });

  final String message;
  final int code;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return '$runtimeType:${code.isNegative ? '' : ' $code:'} $message';
  }
}
