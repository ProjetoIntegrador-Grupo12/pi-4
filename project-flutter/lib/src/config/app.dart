import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_senac/src/core/di/dependency_assembly.dart' as di;
import 'package:todo_senac/src/modules/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_senac/src/modules/todo/presentation/pages/todo_view.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              di.dependencyAssembly<TodoBloc>()..add(const LoadTodosEvent()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoView(),
      ),
    );
  }
}
