import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  ScrollController scrollController = ScrollController();
  List<Todo> todolist = [
    Todo("Cook", false),
    Todo("Read a book", false),
    Todo("Learn flutter", false),
    Todo("Learn flutter", false),
    Todo("Learn flutter", false),
    Todo("Learn flutter", false),
    Todo("Learn flutter", false),
  ];

  onCheck(int index, bool check) {
    setState(() {
      todolist[index].complete = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(
        top: 64,
      ),
      child: CustomScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              title(),
              taskCount(),
              const SizedBox(height: 8, width: 1),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: todolist.length,
                itemBuilder: (context, index) =>
                    task(todolist[index], (check) => onCheck(index, check)),
              )
            ]),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [addTodoButton(context)],
            ),
          )
        ],
      ),
    ));
  }

  Container taskCount() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: const Text(
        "you have 3 tasks remain for today",
        style: TextStyle(
          color: Color(0xff858CA7),
          fontSize: 14,
        ),
      ),
    );
  }

  Container title() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: const Text(
        "My Todo",
        style: TextStyle(
          color: Color(0xff252D89),
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container task(Todo todo, Function(bool) onCheck) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
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
            value: todo.complete,
            onChanged: (check) => onCheck(check ?? false),
          ),
          const SizedBox(width: 8, height: 1),
          Text(
            todo.task,
            style: const TextStyle(
              color: Color(0xff252D89),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  openModalAddTodo(BuildContext context) {
    return showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            width: MediaQuery.sizeOf(context).width,
            height: 180,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "What do you need to do.",
                style: TextStyle(
                  color: Color(0xff858CA7),
                  fontSize: 14,
                ),
              ),
              const TextField(),
              const SizedBox(width: 1, height: 16),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Color(0xff3E4ADE),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: MediaQuery.sizeOf(context).width,
                  child: const Text(
                    "Save",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {},
              )
            ]),
          );
        });
  }

  Container addTodoButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ElevatedButton(
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
        onPressed: () => openModalAddTodo(context),
      ),
    );
  }
}
