
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddNewTask extends TaskEvent {
  final Task task;

  const AddNewTask({required this.task});

  @override
  List<Object> get props => [task];
}

class MarkTaskAsCompleted extends TaskEvent {
  final Task task;

  const MarkTaskAsCompleted({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTaskById extends TaskEvent {
  final String id;

  const DeleteTaskById({required this.id});

  @override
  List<Object> get props => [id];
}

class FilterTasks extends TaskEvent {
  final TaskFilter filter;

  const FilterTasks({required this.filter});

  @override
  List<Object> get props => [filter];
}