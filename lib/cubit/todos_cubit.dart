import 'package:bloc/bloc.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosInitial> {
  TodosCubit() : super(TodosInitial([]));
 // add task
  addTask(String todo) {
    final todoList = state.todos;
    todoList.add(todo);
    emit(TodosInitial(todoList));
  }

// delete
  deleteTask(int index) {
    final todoList = state.todos;
    todoList.removeAt(index);
    emit(TodosInitial(todoList));
  }

  // edit

  editTask(String todo, int index) {
    final todoList = state.todos;
    todoList.removeAt(index);
    todoList.insert(index, todo);
    emit(TodosInitial(todoList));
  }
}
