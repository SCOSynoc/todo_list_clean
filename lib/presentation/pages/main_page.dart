import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/task_models.dart';
import '../bloc/task_bloc.dart';
import '../widgets/TaskFilterWidgetList.dart';
import '../widgets/taskList.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
         const TaskFilterWidget(),
          const Expanded(child: TaskList()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: const InputDecoration(hintText: 'Enter task title'),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        final task = Task(id: DateTime.now().toString(), title: value);
                        context.read<TaskBloc>().add(AddNewTask(task: task));
                        taskController.clear();
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if(taskController.text.isNotEmpty){
                      final task = Task(id: DateTime.now().toString(), title: taskController.text);
                      context.read<TaskBloc>().add(AddNewTask(task: task));
                      taskController.clear();
                    }

                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
