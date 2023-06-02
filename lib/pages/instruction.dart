import 'package:flutter/material.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({super.key});

  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                title(),
                description(),
              ],
            ),
            infographic(),
            continueButton(context)
          ],
        ),
      ),
    );
  }

  ElevatedButton continueButton(BuildContext context) {
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
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, "/todo"),
    );
  }

  Image infographic() => Image.asset("assets/images/check-list.png");

  Text description() {
    return const Text(
      "effective task management at your fingertips",
      style: TextStyle(
        color: Color(0xff858CA7),
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text title() {
    return const Text(
      "The art of task management",
      style: TextStyle(
        color: Color(0xff252D89),
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
