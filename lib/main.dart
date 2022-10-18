import 'package:flutter/material.dart';
import 'package:mobile_form/core/constants/router.dart';
import 'package:mobile_form/core/models/auth_model.dart';
import 'package:mobile_form/core/services/task_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Login('', '', '')),
        ChangeNotifierProvider(create: (_) => Register('', '', '')),
        ChangeNotifierProvider<Tasklist>(create: (context) => Tasklist()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePath.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
