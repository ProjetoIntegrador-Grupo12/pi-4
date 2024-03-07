import 'package:equatable/equatable.dart';

/// Classe Abstrata Base [Failure] para ser implementada.
abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;
}

/// Classe [ConnectionInvalidFailure] referente as exceções de usuário offline;
class ConnectionInvalidFailure extends Failure {
  const ConnectionInvalidFailure({required super.message});
}

/// Classe [ServerErrorFailure] referente as exceções relacionadas ao
/// Servidor.
class ServerErrorFailure extends Failure {
  const ServerErrorFailure({required super.message});
}
