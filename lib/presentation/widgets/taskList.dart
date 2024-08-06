// lib/presentation/widgets/task_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
       if(state is TaskLoading) {
         return const Center(child: CircularProgressIndicator());
       }
        if (state is TasksLoaded) {
          return ListView.builder(
            itemCount: state.filteredTasks.length,
            itemBuilder: (context, index) {
              final task = state.filteredTasks[index];
              return ListTile(
                title: Text(task.title, style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: task.isCompleted,
                      onChanged: (value) {
                        context.read<TaskBloc>().add(MarkTaskAsCompleted(task: task));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        context.read<TaskBloc>().add(DeleteTaskById(id: task.id));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
       return const Center(child: Text("No Task Added Yet"));
      },
    );
  }
}
