import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/const/spacer.dart';
import 'package:todo/cubit/todos_cubit.dart';
import 'package:todo/widgets/common_widgets/primaryBtn.dart';

final TextEditingController _taskTitle = TextEditingController();
final TextEditingController _taskDesc = TextEditingController();
final _formKey = GlobalKey<FormState>();
DateTime? _selectedDate;

Future<void> selectDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null && pickedDate != _selectedDate) {
    // setState(() {
    //   _selectedDate = pickedDate;
    // });
  }
}

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
            padding: const EdgeInsets.symmetric(horizontal: kSpaceLG),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalSpacer(height: 10),
                  TextFormField(
                    cursorColor: primaryColor,
                    cursorHeight: 30,
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
                      hintStyle: TextStyle(
                          color: colorGrey, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    cursorColor: primaryColor,
                    cursorHeight: 30,
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
                      hintStyle: TextStyle(
                          color: colorGrey, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: const SizedBox(
                                      width: 300,
                                      height: 300,
                                      child: SFDateRange(),
                                    ),
                                    actions: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: PrimaryBtn(
                                                  text: "Submit",
                                                  radius: 5,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  })),
                                          Expanded(
                                            child: PrimaryBtn(
                                                text: "Cancel",
                                                btnColor: colorBlack,
                                                radius: 5,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                }),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Icon(
                              Icons.notifications_active,
                              color: colorGrey,
                            ),
                          ),
                          const HorizontalSpacer(width: kSpaceLG),
                          GestureDetector(
                            child: const Icon(
                              Icons.flag,
                              color: colorGrey,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Validation passed, add the task
                            BlocProvider.of<TodosCubit>(context)
                                .addTask(_taskTitle.text);
                            Navigator.pop(context);
                            // _taskTitle.clear();
                          }
                        },
                        child: const Icon(
                          Icons.send_rounded,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  if (_selectedDate != null)
                    Text('Selected Date: ${_selectedDate!.toLocal()}'),
                  const VerticalSpacer(height: kSpaceSM),
                  const DividerThickness(),
                  const VerticalSpacer(height: kSpaceMD),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class SFDateRange extends StatelessWidget {
  const SFDateRange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      selectionMode: DateRangePickerSelectionMode.single,
      view: DateRangePickerView.decade,
      selectionRadius: 20,
      selectionShape: DateRangePickerSelectionShape.circle,
    );
  }
}
