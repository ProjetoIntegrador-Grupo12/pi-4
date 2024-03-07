// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:todo_senac/src/core/adapter/firebase_client.dart';
import 'package:todo_senac/src/core/error/exception.dart';
import 'package:todo_senac/src/core/network/network_info.dart';
import 'package:todo_senac/src/modules/todo/data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<Unit> insert(TodoModel model);
  Future<Unit> delete(String id);
  Future<Unit> update(TodoModel model);
  Future<List<TodoModel>> getAll();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final NetworkInfo networkInfo;
  final FirebaseClient firebaseClient;

  TodoRemoteDataSourceImpl({
    required this.networkInfo,
    required this.firebaseClient,
  });

  @override
  Future<Unit> delete(String id) async {
    try {
      if (!await networkInfo.isConnected) {
        throw ConnectionInvalidException(message: 'Sem conexão');
      }

      await firebaseClient.delete(id);

      return Future.value(unit);
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> getAll() async {
    try {
      if (!await networkInfo.isConnected) {
        throw ConnectionInvalidException(message: 'Sem conexão');
      }

      final result = await firebaseClient.getAll();

      return List.from(result as List)
          .map<TodoModel>(
              (todo) => TodoModel.fromMap(todo as Map<String, dynamic>))
          .toList();
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<Unit> insert(TodoModel model) async {
    try {
      if (!await networkInfo.isConnected) {
        throw ConnectionInvalidException(message: 'Sem conexão');
      }

      await firebaseClient.post(model.toJson());

      return Future.value(unit);
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<Unit> update(TodoModel model) async {
    try {
      if (!await networkInfo.isConnected) {
        throw ConnectionInvalidException(message: 'Sem conexão');
      }

      await firebaseClient.put(model.id!, model.toJson());

      return Future.value(unit);
    } on BaseException {
      rethrow;
    }
  }
}
