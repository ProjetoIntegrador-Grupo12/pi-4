import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_senac/src/core/adapter/firebase_adapter.dart';
import 'package:todo_senac/src/core/adapter/firebase_client.dart';
import 'package:todo_senac/src/core/network/network_info.dart';
import 'package:todo_senac/src/modules/todo/data/datasources/todo_remote_data_source.dart';
import 'package:todo_senac/src/modules/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_senac/src/modules/todo/domain/repositories/todo_repository.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/create_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/delete_all_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/delete_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/get_all_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/domain/usecases/update_todo_use_case.dart';
import 'package:todo_senac/src/modules/todo/presentation/bloc/todo_bloc.dart';

final GetIt dependencyAssembly = GetIt.I;

Future<void> setupDependencyAssemblies() async {

  dependencyAssembly
  
    ..registerLazySingleton<FirebaseClient>(
      () => FirebaseAdapter(
        firebaseFirestore: dependencyAssembly<FirebaseFirestore>(),
      ),
    )
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)

    ..registerLazySingleton<NetworkInfo>(
      NetworkInfoImpl.new,
    );

  _setModuleTodo();
}

void _setModuleTodo() {
  dependencyAssembly

    // Bloc
    ..registerFactory<TodoBloc>(
      () => TodoBloc(
        createTodoUseCase: dependencyAssembly(instanceName: 'create'),
        deleteAllTodoUseCase: dependencyAssembly(instanceName: 'deleteAll'),
        deleteTodoUseCase: dependencyAssembly(instanceName: 'delete'),
        getAllTodoUseCase: dependencyAssembly(instanceName: 'findAll'),
        updateTodoUseCase: dependencyAssembly(instanceName: 'update'),
      ),
    )

    // Use Cases
    ..registerLazySingleton<CreateTodoUseCase>(
      () => CreateTodoUseCase(todoRepository: dependencyAssembly()),
      instanceName: 'create',
    )
    ..registerLazySingleton<UpdateTodoUseCase>(
      () => UpdateTodoUseCase(todoRepository: dependencyAssembly()),
      instanceName: 'update',
    )
    ..registerLazySingleton<GetAllTodoUseCase>(
      () => GetAllTodoUseCase(todoRepository: dependencyAssembly()),
      instanceName: 'findAll',
    )
    ..registerLazySingleton<DeleteAllTodoUseCase>(
      () => DeleteAllTodoUseCase(todoRepository: dependencyAssembly()),
      instanceName: 'deleteAll',
    )
    ..registerLazySingleton<DeleteTodoUseCase>(
      () => DeleteTodoUseCase(
        todoRepository: dependencyAssembly(),
      ),
      instanceName: 'delete',
    )

    // Repository
    ..registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(
        todoRemoteDataSource: dependencyAssembly(),
      ),
    )

    // DataSource
    ..registerLazySingleton<TodoRemoteDataSource>(
      () => TodoRemoteDataSourceImpl(
        firebaseClient: dependencyAssembly(),
        networkInfo: dependencyAssembly(),
      ),
    );
}
