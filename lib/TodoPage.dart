import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/cubit/todos_cubit.dart';
import 'package:todo/widgets/addTaskModal.dart';
import 'package:todo/widgets/common_widgets/primaryBtn.dart';
import 'package:todo/widgets/editTaskModal.dart';

import 'widgets/common_widgets/appbar.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taskTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbar(
        title: "Welcome to the board",
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
                          editTaskModal(context, index, state.todos[index]);
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
            return Column(
              children: [
                PrimaryBtn(
                  text: "Submit",
                  onPressed: () {},
                ),
                const Center(
                  child: Text('No todos available.'),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
