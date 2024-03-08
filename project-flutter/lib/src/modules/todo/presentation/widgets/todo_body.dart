import 'package:flutter/material.dart';
import 'package:todo_senac/src/modules/todo/presentation/widgets/todo_body_field.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 3,
            child: TodoBodyField(),
          ),
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
