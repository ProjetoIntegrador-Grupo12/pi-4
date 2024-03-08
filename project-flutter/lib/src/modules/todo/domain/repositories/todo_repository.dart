import 'package:dartz/dartz.dart';
import 'package:todo_senac/src/core/error/failure.dart';
import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/get_all_todo_use_case.dart';

abstract class TodoRepository {
  Future<Either<Failure, Unit>> create(Todo entity);
  Future<Either<Failure, Unit>> delete(String id);
  Future<Either<Failure, Unit>> deleteAll(NoParams params);
  Future<Either<Failure, Unit>> update(Todo entity);
  Future<Either<Failure, List<Todo>>> getAll(NoParams params);
}
