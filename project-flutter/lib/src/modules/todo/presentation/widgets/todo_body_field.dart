// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_senac/src/core/di/dependency_assembly.dart' as di;
import 'package:todo_senac/src/modules/todo/domain/entities/todo.dart';
import 'package:todo_senac/src/modules/todo/presentation/bloc/todo_bloc.dart';

class TodoBodyField extends StatefulWidget {
  const TodoBodyField({
    super.key,
  });

  @override
  State<TodoBodyField> createState() => _TodoBodyFieldState();
}

class _TodoBodyFieldState extends State<TodoBodyField> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _controller;
  late final TodoBloc bloc;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _controller = TextEditingController();
    bloc = di.dependencyAssembly<TodoBloc>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _controller,
                      cursorColor: Colors.orange,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe uma tarefa';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            gapPadding: 25,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            gapPadding: 25,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.grey),
                          hintText: 'Digite sua tarefa',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                15,
                              ),
                            ),
                          ),
                          errorStyle: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: IconButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          context.read<TodoBloc>().add(
                                CreateTodoEvent(
                                  todo: Todo(
                                    id: null,
                                    text: _controller.text,
                                    isFinished: false,
                                  ),
                                ),
                              );
                        }
                      },
                      iconSize: 45,
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 12, 66, 110),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
