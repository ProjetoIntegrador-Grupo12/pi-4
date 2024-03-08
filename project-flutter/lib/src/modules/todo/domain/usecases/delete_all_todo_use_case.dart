import 'package:dartz/dartz.dart';
import 'package:todo_senac/src/core/error/failure.dart';
import 'package:todo_senac/src/core/usecase/use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/repositories/todo_repository.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/get_all_todo_use_case.dart';

class DeleteAllTodoUseCase implements UseCase<Unit, NoParams> {
  final TodoRepository todoRepository;

  DeleteAllTodoUseCase({
    required this.todoRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return todoRepository.deleteAll(params);
  }
}
