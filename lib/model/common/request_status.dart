abstract class RequestStatus<T> {
  factory RequestStatus.success(T result) => RequestStatusSuccess(result);

  factory RequestStatus.error(dynamic exception) =>
      RequestStatusError(exception);

  static const loading = const RequestStatusLoading();
}

class RequestStatusSuccess<T> implements RequestStatus<T> {
  final T result;

  RequestStatusSuccess(this.result);
}

class RequestStatusError<T> implements RequestStatus<T> {
  final dynamic exception;

  RequestStatusError(this.exception);
}

class RequestStatusLoading<T> implements RequestStatus<T> {
  const RequestStatusLoading();
}
