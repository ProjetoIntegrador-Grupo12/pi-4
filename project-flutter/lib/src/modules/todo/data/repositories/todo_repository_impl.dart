// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo_senac/src/core/error/exception.dart';
import 'package:todo_senac/src/core/error/failure.dart';
import 'package:todo_senac/src/core/extension/parser_extension_exception.dart';
import 'package:todo_senac/src/modules/todo/data/datasources/todo_remote_data_source.dart';
import 'package:todo_senac/src/modules/todo/data/models/todo_model.dart';
import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';
import 'package:todo_senac/src/modules/todo/domain/repositories/todo_repository.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/get_all_todo_use_case.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepositoryImpl({
    required this.todoRemoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> create(Todo entity) async {
    try {
      await todoRemoteDataSource.insert(TodoModel.toEntity(entity));

      return const Right(unit);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(String id) async {
    try {
      await todoRemoteDataSource.delete(id);

      return const Right(unit);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll(NoParams params) async {
    try {
      final future = await todoRemoteDataSource.getAll();

      return Right(future);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> update(Todo entity) async {
    try {
      await todoRemoteDataSource.update(TodoModel.toEntity(entity));

      return const Right(unit);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAll(NoParams params) async {
    try {
      await todoRemoteDataSource.deleteAll();

      return const Right(unit);
    } on BaseException catch (error) {
      return Left(error.mapExceptionToFailure());
    }
  }
}
