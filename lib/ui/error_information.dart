import 'package:flutter/material.dart';

class ErrorInformation extends StatelessWidget {
  final Function onPressed;
  final String errorMessage;
  const ErrorInformation(
      {Key? key, required this.onPressed, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("We couldn't load your data"),
          const SizedBox(height: 10),
          Text(
            "error message: $errorMessage",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
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
