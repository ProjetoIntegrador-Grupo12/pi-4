import 'package:dartz/dartz.dart';
import 'package:todo_senac/src/core/error/failure.dart';
import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';
import 'package:todo_senac/src/modules/todo/domain/repositories/todo_repository.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/get_all_todo_use_case.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<Either<Failure, Unit>> create(Todo entity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll(NoParams params) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update(Todo entity) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
