import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('Funcionou'),
            ),
          );
        },
      ),
    );
  }
}
