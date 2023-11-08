import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[200],
      content: Container(
        height: 250,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            Container(
              height: 200,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.pink[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: TextField(
                      controller: controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        hintText: 'Add a new Task',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  // buttons -> save + cancel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // save button
                      MyButton(text: "Save", onPressed: onSave),

                      const SizedBox(width: 8),

                      // cancel button
                      MyButton(text: "Cancel", onPressed: onCancel),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: 115,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: onPressed,
      color: Colors.pink[400],
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
