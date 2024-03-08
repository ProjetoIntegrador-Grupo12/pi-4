// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodoBodyField extends StatefulWidget {
  const TodoBodyField({
    super.key,
  });

  @override
  State<TodoBodyField> createState() => _TodoBodyFieldState();
}

class _TodoBodyFieldState extends State<TodoBodyField> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              // Wrap TextFormField in Expanded to ensure it takes available space
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText:
                      'Digite algo', // Optional: Adds a label to the TextFormField
                  border:
                      OutlineInputBorder(), // Optional: Adds a border to the TextFormField
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // Your onPressed logic here
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
