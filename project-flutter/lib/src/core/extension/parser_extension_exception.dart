import 'package:todo_senac/src/core/error/exception.dart';
import 'package:todo_senac/src/core/error/failure.dart';

extension ParserExtensionBaseException on BaseException {
  Failure mapExceptionToFailure() {
    switch (runtimeType) {
      case ConnectionInvalidException:
        return ConnectionInvalidFailure(message: message);
      default:
        return ErrorFailure(message: message);
    }
  }
}
