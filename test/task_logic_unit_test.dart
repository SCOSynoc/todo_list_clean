import 'package:test/test.dart';
import 'package:to_do_list_cgi/data/models/task_models.dart';
import 'package:to_do_list_cgi/data/repository/task_repository.dart';

void main() {
  TaskRepository repository = TaskRepository();
  group("Task Load", () {
    test("This return empty task List [] ", (){
        List<Task> result = [];
        result = repository.getAllTasks();
        expect(result,[], reason: "There no data added yet");
    });
  });


  group("Task To Add Data", () {
    test("This will add data to task list  ",() {
      List<Task> result = [
        const Task(id: '1', title: 'Task 1'),
        const Task(id: '2', title: 'Task 2',)
      ];

      repository.addTask(const Task(id: '1', title: 'Task 1'));
      repository.addTask(const Task(id: '2', title: 'Task 2'));
      List<Task> actual = repository.getAllTasks();
      expect(actual, result, verbose: true);
    });
  });

  group("Task To Update or Mark as complete Data", () {
    test("This will add data to task list  ", (){
      List<Task> result = [const Task(id: '1', title: 'Task 1', isCompleted: true), const Task(id: '2', title: 'Task 2',)];
      repository.updateTask(const Task(id: '1', title: 'Task 1', isCompleted: true));
      List<Task> actual = repository.getAllTasks();
      expect(actual,result,);
    });
  });

  group("Task to delete completed data", () {
      test("This will delete id 2 data from list", () {
        List<Task> result = [const Task(id: '1', title: 'Task 1', isCompleted: true),];
        repository.deleteTask("2");
        List<Task> actual = repository.getAllTasks();
        expect(actual,result,);
      });
  });



}