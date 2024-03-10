import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_senac/src/modules/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_senac/src/modules/todo/presentation/widgets/loading.dart';
import 'package:todo_senac/src/widgets/dialogs/dialogs.dart';

class TodoBodyList extends StatefulWidget {
  const TodoBodyList({super.key});

  @override
  State<TodoBodyList> createState() => _TodoBodyListState();
}

class _TodoBodyListState extends State<TodoBodyList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(listener: (context, state) {
      if (state.status == TodoStatus.updated) {
        Dialogs.showCustomSnackBar(context, state.message!, Colors.green);
        context.read<TodoBloc>().add(const LoadTodosEvent());
      }

      if (state.status == TodoStatus.created) {
        context.read<TodoBloc>().add(const LoadTodosEvent());
      }

      if (state.status == TodoStatus.deleted) {
        Dialogs.showCustomSnackBar(context, state.message!, Colors.green);
        context.read<TodoBloc>().add(const LoadTodosEvent());
      }
      if (state.status == TodoStatus.error) {
        Dialogs.showCustomSnackBar(context, state.message!, Colors.red);
      }
    }, builder: (context, state) {
      if (state.status == TodoStatus.loading) {
        return const Loading();
      }

      if (state.listOfTodos.isEmpty) {
        return Center(
          child: InkWell(
            onTap: () async =>
                context.read<TodoBloc>().add(const LoadTodosEvent()),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.manage_search,
                  size: 60,
                  color: Colors.orange,
                ),
                SizedBox(height: 24),
                Text(
                  'Adicione uma tarefa',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 198, 198, 198),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return ListView.builder(
          itemCount: state.listOfTodos.length,
          itemBuilder: (context, index) {
            final item = state.listOfTodos[index];

            return Dismissible(
              key: Key(item.text),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) =>
                  context.read<TodoBloc>().add(DeleteTodoEvent(id: item.id!)),
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
              child: GestureDetector(
                onTap: () => context
                    .read<TodoBloc>()
                    .add(UpdateTodoEvent(todo: item, isFinished: true)),
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 10),
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
                          onChanged: null,
                          value: item.isFinished,
                          title: Text(
                            item.text,
                            style: TextStyle(
                                decoration: item.isFinished
                                    ? TextDecoration.lineThrough
                                    : null,
                                fontSize: 20,
                                color: item.isFinished
                                    ? Colors.grey
                                    : Colors.white,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
