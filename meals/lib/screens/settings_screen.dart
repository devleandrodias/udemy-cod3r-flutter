import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraçōes'),
      ),
      body: Center(
        child: Text('Configuraçōes'),
      ),
      drawer: MainDrawer(),
    );
  }
}
