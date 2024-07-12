class Failure {
  Failure(this.title, this.message, this.error);

  final String title;

  final String message;
  final dynamic error;

  @override
  String toString() {
    return 'Failure{title: $title, message: $message}';
  }
}
