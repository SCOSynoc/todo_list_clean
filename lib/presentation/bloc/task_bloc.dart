
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list_cgi/data/repository/task_repository.dart';
import '../../data/models/task_models.dart';
import '../../domain/usecases/task_usecases.dart';

part 'task_event.dart';
part 'task_state.dart';

enum TaskFilter { all, completed, pending }


class TaskBloc extends Bloc<TaskEvent, TaskState> {

  TaskBloc() : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddNewTask>(_onAddNewTask);
    on<MarkTaskAsCompleted>(_onMarkTaskAsCompleted);
    on<DeleteTaskById>(_onDeleteTaskById);
    on<FilterTasks>(_onFilterTasks);
  }

  final TaskRepository _repository = TaskRepository();

  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) {
    emit(TaskLoading());
    final tasks = GetTasks(_repository).call();
    emit(TasksLoaded(tasks: tasks, filteredTasks: tasks, filter: TaskFilter.all));
  }

  void _onAddNewTask(AddNewTask event, Emitter<TaskState> emit) {
    AddTask(_repository).call(event.task);
    add(LoadTasks());
  }

  void _onMarkTaskAsCompleted(MarkTaskAsCompleted event, Emitter<TaskState> emit) {
    final currentTask = event.task;
    Task updatedTask = Task(id: currentTask.id, title: currentTask.title, isCompleted: true );
    UpdateTask(_repository).call(updatedTask);
    add(LoadTasks());
  }

  void _onDeleteTaskById(DeleteTaskById event, Emitter<TaskState> emit) {
    DeleteTask(_repository).call(event.id);
    add(LoadTasks());
  }

  void _onFilterTasks(FilterTasks event, Emitter<TaskState> emit) {
    if (state is TasksLoaded) {
      final currentState = state as TasksLoaded;
      List<Task> filteredTasks;
      switch (event.filter) {
        case TaskFilter.completed:
          filteredTasks = currentState.tasks.where((task) => task.isCompleted).toList();
          break;
        case TaskFilter.pending:
          filteredTasks = currentState.tasks.where((task) => !task.isCompleted).toList();
          break;
        case TaskFilter.all:
        default:
          filteredTasks = currentState.tasks;
      }
      emit(TasksLoaded(
        tasks: currentState.tasks,
        filteredTasks: filteredTasks,
        filter: event.filter,
      ));
    }
  }
}


