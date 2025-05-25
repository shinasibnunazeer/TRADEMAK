

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}


class FirebaseFailure extends Failure {
  FirebaseFailure({required super.message});

}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message});
 
}