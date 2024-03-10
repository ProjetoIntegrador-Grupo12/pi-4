import 'package:flutter/material.dart';
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
      child: Flex(
        direction: Axis.vertical,
        children: [
          const Expanded(
            flex: 2,
            child: TodoBodyField(),
          ),
          const Expanded(
            flex: 11,
            child: TodoBodyList(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Você possui 5 tarefas pendentes',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Limpar tudo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 66, 110),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
