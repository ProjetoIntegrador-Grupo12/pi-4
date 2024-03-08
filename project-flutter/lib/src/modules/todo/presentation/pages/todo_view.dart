import 'package:flutter/material.dart';
import 'package:todo_senac/src/modules/todo/presentation/widgets/todo_appbar.dart';
import 'package:todo_senac/src/modules/todo/presentation/widgets/todo_body.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: TodoAppBar(),
      body: TodoBody(),
    );
  }
}
