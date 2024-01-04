import 'package:bloc/bloc.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosInitial> {
  TodosCubit() : super(TodosInitial([]));

  addTask(String todo) {
    final todoList = state.todos;
    todoList.add(todo);
    emit(TodosInitial(todoList));
  }

  deleteTask(int index) {
    final todoList = state.todos;
    todoList.removeAt(index);
    emit(TodosInitial(todoList));
  }

  editTask(String todo, int index) {
    final todoList = state.todos;
    todoList.removeAt(index);
    todoList.insert(index, todo);
    emit(TodosInitial(todoList));
  }
}
