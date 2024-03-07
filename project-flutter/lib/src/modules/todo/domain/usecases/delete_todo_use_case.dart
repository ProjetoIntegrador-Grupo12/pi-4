import 'package:dartz/dartz.dart';
import 'package:todo_senac/src/core/error/failure.dart';
import 'package:todo_senac/src/core/usecase/use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/repositories/todo_repository.dart';

class DeleteTodoUseCase implements UseCase<Unit, String> {
  final TodoRepository todoRepository;

  DeleteTodoUseCase({
    required this.todoRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(String id) async {
    return todoRepository.delete(id);
  }
}
