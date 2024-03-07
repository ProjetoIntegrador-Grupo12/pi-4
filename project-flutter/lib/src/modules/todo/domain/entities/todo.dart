// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String? id;
  final String text;
  final bool isFinished;

  const Todo({
    required this.id,
    required this.text,
    required this.isFinished,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        isFinished,
      ];
}
