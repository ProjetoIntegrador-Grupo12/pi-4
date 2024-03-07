import 'package:dartz/dartz.dart';
import 'package:todo_senac/src/core/error/failure.dart';
import 'package:todo_senac/src/core/usecase/use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';
import 'package:todo_senac/src/modules/todo/domain/repositories/todo_repository.dart';

class UpdateTodoUseCase implements UseCase<Unit, Todo> {
  final TodoRepository todoRepository;

  UpdateTodoUseCase({
    required this.todoRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(Todo entity) async {
    return todoRepository.update(entity);
  }
}
