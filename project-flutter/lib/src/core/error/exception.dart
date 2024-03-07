/// Interface [BaseException] criada para implementação das exceptions
/// personalizadas.
abstract class BaseException implements Exception {
  final int statusCode;
  final String message;

  BaseException({
    required this.statusCode,
    required this.message,
  });
}

/// Classe [ConnectionInvalidException] é uma exceção que indica que o
/// dispositivo do usuário não está conectado com a internet.
class ConnectionInvalidException extends BaseException {
  ConnectionInvalidException({
    required super.message,
  }) : super(
          statusCode: 900,
        );
}

/// Classe [ErrorException] é uma exceção indica que algo deu
/// errado no servidor, mas o servidor não pode especificar a
/// natureza exata do problema
class ErrorException extends BaseException {
  ErrorException()
      : super(
          statusCode: 500,
          message: 'Desculpe, ocorreu um erro interno.',
        );
}
