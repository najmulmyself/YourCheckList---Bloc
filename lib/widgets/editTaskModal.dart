

  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todos_cubit.dart';
  final TextEditingController _taskCon = TextEditingController();


void editTaskModal(BuildContext context, index, text) {
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
                // if empty

                if (editTask.value.text.isNotEmpty) {
                  BlocProvider.of<TodosCubit>(context)
                      .editTask(editTask.value.text, index);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    //showing a snackbar
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