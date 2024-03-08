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

class FinishedTodoEvent extends TodoEvent {
  final Todo todo;

  const FinishedTodoEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [
        todo,
      ];
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;

  const UpdateTodoEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [
        todo,
      ];
}
