// lib/presentation/widgets/task_filter_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';




class TaskFilterWidget extends StatelessWidget {
  const TaskFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: TaskFilter.values.map((filter) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(filter.toString().split('.').last),
                  selected: state.filter == filter,
                  onSelected: (selected) {
                    context.read<TaskBloc>().add(FilterTasks(filter: filter));
                  },
                ),
              );
            }).toList(),
          );
        }
        return SizedBox();
      },
    );
  }
}
