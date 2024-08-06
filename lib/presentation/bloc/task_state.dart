part of 'task_bloc.dart';


abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TasksLoaded extends TaskState {
  final List<Task> tasks;
  final List<Task> filteredTasks;
  final TaskFilter filter;

  const TasksLoaded({
    required this.tasks,
    required this.filteredTasks,
    required this.filter,
  });

  @override
  List<Object> get props => [tasks, filteredTasks, filter];
}

class TaskLoading extends TaskState {}

