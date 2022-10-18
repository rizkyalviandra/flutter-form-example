import 'package:flutter/material.dart';
import 'package:mobile_form/core/models/task_model.dart';
import 'package:mobile_form/core/services/task_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Task> taskList = context.watch<Tasklist>().taskList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text(taskList[index].name));
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'addTask');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
