import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/provider/greate_places_provider.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) return;

    Provider.of<GreatPlacesProvider>(
      context,
      listen: false,
    ).addPlaces(
      _titleController.text,
      _pickedImage,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(this._selectImage),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          RaisedButton.icon(
            onPressed: _submitForm,
            elevation: 0,
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.add),
            label: Text('Adicionar'),
            textColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
