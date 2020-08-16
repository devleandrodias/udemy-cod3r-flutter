import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text('Nenhuma Imagem!'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera_alt),
            label: Text('Tirar Foto'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
