import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Erro no servidor');
}

class EmptyResultFailure extends Failure {
  const EmptyResultFailure() : super('sem dados');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('Erro no cache');
}

class ConectionFailure extends Failure {
  const ConectionFailure() : super('Erro na internet');
}

class UnknowFailure extends Failure {
  const UnknowFailure() : super('Erro inesperado');
}
