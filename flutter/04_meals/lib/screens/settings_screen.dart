import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(
    this.onSettingsChanged,
    this.settings,
  );

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      activeColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraçōes'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glutên',
                  'Só exibe refeiçōes sem glutén',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeiçōes sem lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Só Vegano',
                  'Só exibe refeiçōes veganas',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Só Vegetarianas',
                  'Só exibe refeiçōes vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
