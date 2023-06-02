import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Todo",
                    style: TextStyle(
                      color: Color(0xff252D89),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "you have 3 tasks remain for today",
                    style: TextStyle(
                      color: Color(0xff858CA7),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
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
                    "Add Todo",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, "/todo"),
              ),
            ],
          )),
    );
  }
}
