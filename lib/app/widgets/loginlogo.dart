import 'package:flutter/material.dart';

class TodoLogo extends StatelessWidget {
  const TodoLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 80,
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Text(
          'mimo',
          style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
