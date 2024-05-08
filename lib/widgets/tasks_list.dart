import 'package:flutter/material.dart';
import 'package:flutter_task_manager/widgets/tasks_tile.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task>? tasks;

  const TasksList({
    super.key, this.tasks
  });

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks![index].name,
            isChecked: widget.tasks![index].isDone,
            checkboxCallback: (bool? checkboxState) {
              setState(() {
                widget.tasks![index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks?.length,
    );
  }
}
