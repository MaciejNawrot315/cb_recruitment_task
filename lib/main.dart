import 'package:code_borthers_recruitment_task/services/network_services/network_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

NetworkService networkService = NetworkService();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
