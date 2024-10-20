enum AppErrorEnum {
  api('API error occurred'),
  network('Network error, please check your connection'),
  notFound('Requested resource not found');

  const AppErrorEnum(this.message);

  final String message;

  @override
  String toString() => message;
}
