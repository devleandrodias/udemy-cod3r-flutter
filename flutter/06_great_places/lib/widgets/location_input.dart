import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentLocation() async {
    final localData = await Location().getLocation();

    print(localData.latitude);
    print(localData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text('Nenhuma localizacão não informada')
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: _getCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text(
                'Local Atual',
              ),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text(
                'Selecione no Mapa',
              ),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
