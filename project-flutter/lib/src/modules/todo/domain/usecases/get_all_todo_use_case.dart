import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_senac/src/core/error/failure.dart';
import 'package:todo_senac/src/core/usecase/use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';
import 'package:todo_senac/src/modules/todo/domain/repositories/todo_repository.dart';

class GetAllTodoUseCase implements UseCase<List<Todo>, NoParams> {
  final TodoRepository todoRepository;

  GetAllTodoUseCase({
    required this.todoRepository,
  });

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    return todoRepository.getAll(params);
  }
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
