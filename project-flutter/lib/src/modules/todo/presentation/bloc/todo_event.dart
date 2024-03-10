// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class LoadTodosEvent extends TodoEvent {
  const LoadTodosEvent();

  @override
  List<Object?> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final Todo todo;

  const CreateTodoEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;

  const DeleteTodoEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class DeleteAllTodosEvent extends TodoEvent {
  const DeleteAllTodosEvent();

  @override
  List<Object?> get props => [];
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;
  final bool isFinished;

  const UpdateTodoEvent({
    required this.todo,
    this.isFinished = false,
  });

  @override
  List<Object?> get props => [
        todo,
      ];
}
