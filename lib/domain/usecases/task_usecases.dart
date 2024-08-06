
import 'package:equatable/equatable.dart';

import '../../data/models/task_models.dart';
import '../../data/repository/task_repository.dart';




class GetTasks  {
  final TaskRepository repository;

  GetTasks(this.repository);

  List<Task> call()  {
    return repository.getAllTasks();
  }


}

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  void call(Task task) {
    repository.addTask(task);
  }
}

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  void call(Task task) {
    repository.updateTask(task);
  }
}

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  void call(String id) {
    repository.deleteTask(id);
  }
}
