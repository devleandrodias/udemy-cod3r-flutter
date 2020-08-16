import 'package:flutter/material.dart';
import 'package:great_places/provider/greate_places_provider.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          )
        ],
      ),
      body: Consumer<GreatPlacesProvider>(
        child: Center(
          child: Text('Nenhum Lugar Cadastrado!'),
        ),
        builder: (ctx, greatePlace, child) => greatePlace.itemsCount == 0
            ? child
            : ListView.builder(
                itemCount: greatePlace.itemsCount,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatePlace.itemByIndex(index).image,
                    ),
                  ),
                  title: Text(greatePlace.itemByIndex(index).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
