extension ListExtensions<T> on List<T> {
  List<R> mapList<R>(R Function(T e) toElement) {
    return map(toElement).toList();
  }
}
