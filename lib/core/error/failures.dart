import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic err;

  Failure(this.err);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {



  ServerFailure(dynamic err):super(err);

}

class CacheFailure extends Failure {

  CacheFailure(dynamic err):super(err);
}
