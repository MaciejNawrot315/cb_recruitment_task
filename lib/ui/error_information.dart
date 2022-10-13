import 'package:flutter/material.dart';

class ErrorInformation extends StatelessWidget {
  final Function onPressed;
  const ErrorInformation({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("We couldn't load your data"),
          TextButton(
            onPressed: () => onPressed(),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
            ),
            child: const Text(
              "Retry",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
