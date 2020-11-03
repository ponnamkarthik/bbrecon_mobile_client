class ResponseData<T> {
  ResponseData(this.message, this.status, {this.data});

  final T data;
  final String message;
  final ResponseStatus status;

  @override
  String toString() => message;
}

enum ResponseStatus {
  // ignore: constant_identifier_names
  SUCCESS,
  // ignore: constant_identifier_names
  FAILED,
}
