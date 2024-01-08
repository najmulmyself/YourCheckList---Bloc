import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/cubit/todos_cubit.dart';

final TextEditingController _taskTitle = TextEditingController();
final TextEditingController _taskDesc = TextEditingController();
final _formKey = GlobalKey<FormState>();

void showAddTaskModal(BuildContext context) {
  _taskTitle.clear();
  _taskDesc.clear();
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    cursorColor: Colors.green,
                    controller: _taskTitle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field should not be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'eg: Meeting with client',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    cursorColor: Colors.green,
                    controller: _taskDesc,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field should not be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.single,
                          view: DateRangePickerView.decade,
                          selectionRadius: 20,
                          selectionShape: DateRangePickerSelectionShape.circle,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Validation passed, add the task
                        BlocProvider.of<TodosCubit>(context)
                            .addTask(_taskTitle.text);
                        Navigator.pop(context);
                        // _taskTitle.clear();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
