// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/create_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/delete_all_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/delete_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/get_all_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/update_todo_use_case.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodoUseCase createTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final DeleteAllTodoUseCase deleteAllTodoUseCase;
  final GetAllTodoUseCase getAllTodoUseCase;

  TodoBloc({
    required this.createTodoUseCase,
    required this.updateTodoUseCase,
    required this.deleteTodoUseCase,
    required this.deleteAllTodoUseCase,
    required this.getAllTodoUseCase,
  }) : super(TodoState.initial()) {
    on<CreateTodoEvent>(_create);
    on<UpdateTodoEvent>(_update);
    on<LoadTodosEvent>(_load);
    on<DeleteAllTodosEvent>(_deleteAll);
    on<DeleteTodoEvent>(_delete);
  }

  FutureOr<void> _create(
    CreateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      final result = await createTodoUseCase.call(event.todo);

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: TodoStatus.error,
            message: 'Houve um erro ao tentar criar uma tarefa',
          ),
        ),
        (_) => emit(
          state.copyWith(
            status: TodoStatus.created,
            message: 'Tarefa adicionada com sucesso',
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
          message: 'Houve um erro ao tentar criar uma tarefa',
        ),
      );
    }
  }

  FutureOr<void> _update(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      Todo todo = Todo(
          id: event.todo.id,
          text: event.todo.text,
          isFinished: event.isFinished
              ? !event.todo.isFinished
              : event.todo.isFinished);

      final result = await updateTodoUseCase.call(todo);

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: TodoStatus.error,
            message: 'Houve um erro ao tentar atualizar uma tarefa',
          ),
        ),
        (_) => emit(
          state.copyWith(
            status: TodoStatus.updated,
            message: 'Tarefa alterado com sucesso',
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
          message: 'Houve um erro ao tentar atualizar uma tarefa',
        ),
      );
    }
  }

  FutureOr<void> _load(
    LoadTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );

    try {
      final result = await getAllTodoUseCase.call(const NoParams());

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: TodoStatus.error,
            message: 'Houve um erro ao tentar criar uma tarefa',
          ),
        ),
        (todos) => emit(
          state.copyWith(
            status: TodoStatus.loaded,
            listOfTodos: todos,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
          message: 'Houve um erro ao tentar criar uma tarefa',
        ),
      );
    }
  }

  FutureOr<void> _deleteAll(
    DeleteAllTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );

    try {
      final result = await deleteAllTodoUseCase.call(const NoParams());

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: TodoStatus.error,
            message: 'Houve um erro ao tentar excluir todas as tarefas',
          ),
        ),
        (_) => emit(
          state.copyWith(
            status: TodoStatus.deleted,
            message: 'Tarefas excluídas com sucesso',
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
          message: 'Houve um erro ao tentar excluir todas as tarefas',
        ),
      );
    }
  }

  FutureOr<void> _delete(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodoStatus.loading,
      ),
    );

    try {
      final result = await deleteTodoUseCase.call(event.id);

      result.fold(
        (failure) => emit(
          state.copyWith(
            status: TodoStatus.error,
            message: 'Houve um erro ao tentar excluir a tarefa',
          ),
        ),
        (_) => emit(
          state.copyWith(
            status: TodoStatus.deleted,
            message: 'Tarefa excluída com sucesso',
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodoStatus.error,
          message: 'Houve um erro ao tentar excluir a tarefa',
        ),
      );
    }
  }
}
