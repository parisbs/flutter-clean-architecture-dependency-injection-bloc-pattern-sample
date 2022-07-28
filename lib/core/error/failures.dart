import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class HttpFailure extends Failure {
  const HttpFailure({required this.statusCode, required this.statusMessage});

  final int statusCode;
  final String statusMessage;

  @override
  String toString() {
    return '$runtimeType: Status code $statusCode: $statusMessage';
  }
}

class UnknownException extends Failure {}
