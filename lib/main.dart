import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tarea_dos/home/home_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:tarea_dos/models/todo_reminder.dart';

import 'models/todo_reminder.dart';

void main() async {
  // TODO: inicializar hive y agregar el adapter
  Hive.registerAdapter(TodoRemainderAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  final _local_storage = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(_local_storage.path);
  await Hive.openBox("configs");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 2',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.grey[50],
      ),
      home: HomePage(),
    );
  }
}
