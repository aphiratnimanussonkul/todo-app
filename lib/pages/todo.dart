import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todolist = [
    Todo("Cook", false),
    Todo("Read a book", false),
    Todo("Learn flutter", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                taskCount(),
                const SizedBox(height: 8),
                task(),
                task(),
                task(),
                task(),
                task(),
              ],
            ),
            addTodoButton(context),
          ],
        ),
      ),
    );
  }

  Text taskCount() {
    return const Text(
      "you have 3 tasks remain for today",
      style: TextStyle(
        color: Color(0xff858CA7),
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text title() {
    return const Text(
      "My Todo",
      style: TextStyle(
        color: Color(0xff252D89),
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Container task() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 228, 228, 228),
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            side: const BorderSide(color: Color(0xff3E4ADE), width: 1.5),
            fillColor: const MaterialStatePropertyAll<Color>(Colors.white),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3))),
            checkColor: const Color(0xff3E4ADE),
            value: false,
            onChanged: (check) {},
          ),
          const SizedBox(width: 8),
          const Text(
            "Cook",
            style: TextStyle(
              color: Color(0xff252D89),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton addTodoButton(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
          Color(0xff3E4ADE),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: MediaQuery.sizeOf(context).width,
        child: const Text(
          "Add Todo",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, "/todo"),
    );
  }
}
