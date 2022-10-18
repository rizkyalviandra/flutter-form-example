import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_form/core/services/task_service.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Add new task"),
              controller: todoController,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    context.read<Tasklist>().addNewTask(todoController.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Add Task'),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
