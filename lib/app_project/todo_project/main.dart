import 'package:flutter/material.dart';
import 'package:reservation_system/app_project/todo_project/class/task.dart';
import 'package:reservation_system/app_project/todo_project/class/user.dart';
import 'package:reservation_system/app_project/todo_project/service/todo_service.dart';
import 'package:reservation_system/app_project/todo_project/service/user_service.dart';
import 'package:reservation_system/models/share_preference/preferences.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await AppPreference.init();
  // runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {
                tasks = await TodoService.getTaskFromServer();
                tasks = tasks.reversed.toList();
                setState(() {});
              },
              icon: Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    String taskName = "";
                    return AlertDialog(
                      title: Text("Add new Task"),
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "input your task",
                            ),
                            onChanged: (value) => {taskName = value},
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            final result = await TodoService.createNewTask(
                              taskName: taskName,
                            );
                            Navigator.pop(context, result);
                          },
                          child: Text("save"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.add_box_rounded),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskCard(task: tasks[index], onChanged: (value) {});
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: tasks.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  const TaskCard({super.key, required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(value: task.isCompleted ?? false, onChanged: onChanged),
          Text(task.task ?? ""),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController taskController =
                      TextEditingController();
                  taskController.text = task.task ?? "";
                  return AlertDialog(
                    title: Text("Edit Task"),
                    content: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "input your task",
                          ),
                          controller: taskController,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          final result = await TodoService.updateTask(
                            id: task.id ?? "",
                            name: taskController.text,
                          );
                          task.task = taskController.text;
                          Navigator.pop(context, result);
                        },
                        child: Text("save"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("cancel"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.person, size: 20),
          Column(
            children: [
              Text(user.name.toString()),
              Text(user.phoneNumber.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
