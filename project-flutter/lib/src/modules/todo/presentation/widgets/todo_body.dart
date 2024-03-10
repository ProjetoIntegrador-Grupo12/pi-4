import 'package:flutter/material.dart';
import 'package:todo_senac/src/modules/todo/presentation/widgets/todo_body_count.dart';
import 'package:todo_senac/src/modules/todo/presentation/widgets/todo_body_field.dart';
import 'package:todo_senac/src/modules/todo/presentation/widgets/todo_body_list.dart';

class TodoBody extends StatefulWidget {
  const TodoBody({super.key});

  @override
  State<TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<TodoBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 12, 66, 110),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
      ),
      child: const Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 2,
            child: TodoBodyField(),
          ),
          Expanded(
            flex: 11,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: TodoBodyList(),
            ),
          ),
          Expanded(
            flex: 2,
            child: TodoBodyCount(),
          )
        ],
      ),
    );
  }
}
