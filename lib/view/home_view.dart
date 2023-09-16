import 'package:flutter/material.dart';
import 'package:todo_list/controller/home_controller.dart';
import 'package:todo_list/model/todo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Todo> notes = [];
  TextEditingController tfController = TextEditingController();
  HomeController homeController = HomeController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      List<Todo>? todos = await homeController.getTodos();
      if (todos != null) {
        notes = todos;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (tfController.text.isNotEmpty) {
            await homeController.createTodo(
                title: tfController.text,
                isComplete: false,
                callback: () async {
                  notes.add(Todo(title: tfController.text));
                  tfController.clear();
                  setState(() {});
                });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext insContext, int index) {
                return ItemNote(
                  item: notes[index],
                  onCheckBoxChanged: (bool value) {
                    notes[index].isComplete = value;
                    setState(() {});
                  },
                );
              },
              itemCount: notes.length,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: tfController,
              )),
        ],
      ),
    );
  }
}

class ItemNote extends StatelessWidget {
  final Todo item;
  final Function(bool) onCheckBoxChanged;
  const ItemNote(
      {super.key, required this.item, required this.onCheckBoxChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(
              value: item.isComplete ?? false,
              onChanged: (value) {
                onCheckBoxChanged.call(value ?? false);
              }),
          Text(item.title ?? '')
        ],
      ),
    );
  }
}
