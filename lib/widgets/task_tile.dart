import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/providers/task_provider.dart';
import 'package:todo/theme/app_theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.taskIndex,
  });

  final int taskIndex;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        context.read<TaskProvider>().deleteTask(taskIndex);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Task "${task.title}" deleted successfully!'),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: task.isCompleted,
                onChanged: (val) {
                  context.read<TaskProvider>().toggleStatus(taskIndex);
                },
                shape: CircleBorder(),
                activeColor: AppTheme.primaryColor,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        color: task.isCompleted ? Theme.of(context).textTheme.headlineMedium!.color!.withValues(alpha: 0.75) : Theme.of(context).textTheme.headlineMedium!.color,
                      ),
                    ),
                    Text(
                      task.description,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        color: task.isCompleted ? Theme.of(context).textTheme.headlineMedium!.color!.withValues(alpha: 0.75) : Theme.of(context).textTheme.headlineMedium!.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
