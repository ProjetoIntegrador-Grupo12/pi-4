import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_senac/src/modules/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_senac/src/widgets/dialogs/dialogs.dart';

class TodoBodyCount extends StatelessWidget {
  const TodoBodyCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        final count = state.listOfTodos.length;

        return Row(
          children: [
            Expanded(
              child: Text(
                'Você possui $count tarefas pendentes',
                style: const TextStyle(
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
                onPressed: () {
                  count > 0
                      ? Dialogs.showDeleteTodosConfirma(context, action: () {
                          context
                              .read<TodoBloc>()
                              .add(const DeleteAllTodosEvent());
                        })
                      : null;
                },
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
        );
      },
    );
  }
}
