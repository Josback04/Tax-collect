import 'failure.dart';

class MessageError extends Failure implements Exception {
  MessageError(super.title, super.message, super.error);
}
