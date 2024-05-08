import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallback;

  const TaskTile({super.key, this.isChecked = false, this.taskTitle = "", this.checkboxCallback
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked, onChanged: checkboxCallback
      ),
    );
  }
}



// class TaskCheckbox extends StatelessWidget {
//   final bool? checkboxState;
//   final Function(bool?)? toggleCheckboxState;
//
//   const TaskCheckbox({super.key, this.checkboxState, this.toggleCheckboxState});
//
//   // TaskCheckbox(this.checkboxState)
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
