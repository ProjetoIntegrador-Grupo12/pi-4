import 'package:flutter/material.dart';

class Dialogs {
  static void showDeleteTodosConfirma(BuildContext context,
      {required VoidCallback action}) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar tudo'),
        content:
            const Text('Você tem certeza que deseja apagar todas as tarefas ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.green),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              action();
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.red),
            child: const Text('Limpar tudo'),
          ),
        ],
      ),
    );
  }

  static void showCustomSnackBar(
      BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: const Duration(seconds: 2),
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
