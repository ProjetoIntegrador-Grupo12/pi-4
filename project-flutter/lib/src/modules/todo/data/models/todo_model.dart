import 'dart:convert';

import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel({
    required super.id,
    required super.text,
    required super.isFinished,
  });

  factory TodoModel.instance() => const TodoModel(
        id: '',
        text: '',
        isFinished: false,
      );

  TodoModel fromEntity(TodoModel model) => TodoModel(
        id: model.id,
        text: model.text,
        isFinished: model.isFinished,
      );

  factory TodoModel.toEntity(Todo entity) => TodoModel(
        id: entity.id,
        text: entity.text,
        isFinished: entity.isFinished,
      );

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id']?.toString(),
      text: map['text'],
      isFinished: map['isFinished'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'isFinished': isFinished,
    };
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
