import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_senac/src/modules/todo/presentation/bloc/todo_bloc.dart';

class TodoBodyList extends StatefulWidget {
  const TodoBodyList({super.key});

  @override
  State<TodoBodyList> createState() => _TodoBodyListState();
}

class _TodoBodyListState extends State<TodoBodyList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.listOfTodos.length,
            itemBuilder: (context, index) {
              final item = state.listOfTodos[index];

              return Dismissible(
                key: Key(item.text),
                direction: DismissDirection.endToStart,
                background: Container(
                  height: 80,
                  color: Colors.red,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                child: Container(
                  height: 80,
                  // margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(left: 20),
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 155, 153, 174)
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(22)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: item.isFinished ? Colors.green : Colors.red,
                            shape: BoxShape.circle),
                        child: Icon(
                          item.isFinished ? Icons.done : Icons.error,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: CheckboxListTile(
                          onChanged: (_) => context.read<TodoBloc>().add(FinishedTodoEvent(todo: item)),
                          value: item.isFinished,
                          title: Text(
                            item.text,
                            style: TextStyle(
                              decoration:
                                  item.isFinished ? TextDecoration.lineThrough : null,
                              fontSize: 20,
                              color: item.isFinished ? Colors.grey : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
