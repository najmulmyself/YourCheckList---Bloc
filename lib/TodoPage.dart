import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todos_cubit.dart';

class TodoPage extends StatelessWidget {
  final TextEditingController _taskCon = TextEditingController();
  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos App'),
      ),
      body: BlocBuilder<TodosCubit, TodosInitial>(
        builder: (context, state) {
          if (state.todos.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (contex, index) {
                  return ListTile(
                    leading: GestureDetector(
                        onTap: () {
                          _editTaskDialouge(context, index, state.todos[index]);
                        },
                        child: const Icon(Icons.edit)),
                    title: Text(state.todos[index]),
                    trailing: GestureDetector(
                      onTap: () {
                        BlocProvider.of<TodosCubit>(context).deleteTask(index);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('No todos available.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: _taskCon,
            decoration: const InputDecoration(labelText: 'Enter new task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_taskCon.value.text.isNotEmpty) {
                  BlocProvider.of<TodosCubit>(context)
                      .addTask(_taskCon.value.text);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Field should not be empty"),
                    ),
                  );
                }
                _taskCon.clear();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _editTaskDialouge(BuildContext context, index, text) {
    TextEditingController editTask = TextEditingController(text: text);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: editTask,
            decoration: const InputDecoration(labelText: 'Edit task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (editTask.value.text.isNotEmpty) {
                  BlocProvider.of<TodosCubit>(context)
                      .editTask(editTask.value.text, index);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Field should not be empty"),
                    ),
                  );
                }
                _taskCon.clear();
              },
              child: const Text('Edit'),
            ),
          ],
        );
      },
    );
  }
}
