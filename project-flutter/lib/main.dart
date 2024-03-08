import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_senac/src/firebase_options.dart';
import 'package:todo_senac/src/config/app.dart';
import 'package:todo_senac/src/core/di/dependency_assembly.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.setupDependencyAssemblies();

  runApp(const App());
}
