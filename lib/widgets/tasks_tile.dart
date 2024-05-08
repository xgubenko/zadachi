import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function()? longPressCallback;

  const TaskTile({super.key
    , this.isChecked = false
    , this.taskTitle = ""
    , this.checkboxCallback
    , this.longPressCallback
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
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
