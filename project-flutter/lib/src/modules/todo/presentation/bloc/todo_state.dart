part of 'todo_bloc.dart';

enum TodoStatus {
  initial,
  loading,
  loaded,
  created,
  updated,
  deleted,
  finished,
  error,
}

class TodoState extends Equatable {
  final String? message;
  final TodoStatus status;
  final List<Todo> listOfTodos;

  const TodoState({
    this.message,
    required this.status,
    required this.listOfTodos,
  });

  factory TodoState.initial() => const TodoState(
        status: TodoStatus.initial,
        listOfTodos: [],
      );

  TodoState copyWith({
    String? message,
    TodoStatus? status,
    List<Todo>? listOfTodos,
  }) {
    return TodoState(
      message: message ?? this.message,
      status: status ?? this.status,
      listOfTodos: listOfTodos ?? this.listOfTodos,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        listOfTodos,
      ];
}
