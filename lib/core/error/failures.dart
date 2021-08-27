import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthFailure extends Failure {
  final message = 'Authentication failed';
}
