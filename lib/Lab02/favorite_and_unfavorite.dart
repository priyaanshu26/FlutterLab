import 'package:flutter/material.dart';

class FavoriteAndUnfavorite extends StatefulWidget {
  const FavoriteAndUnfavorite({super.key});

  @override
  State<FavoriteAndUnfavorite> createState() => _FavoriteAndUnfavoriteState();
}

class _FavoriteAndUnfavoriteState extends State<FavoriteAndUnfavorite> {

  List<Map> users = [
    {
      "name" : 'abcd',
      "isFavorite" : true,
    },
    {
      "name" : 'xyz',
      "isFavorite" : false,
    },
    {
      "name" : 'pqr',
      "isFavorite" : true,
    },
    {
      "name" : 'lmn',
      "isFavorite" : false,
    },
    {
      "name" : 'rst',
      "isFavorite" : true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Favorite and Un-favorite', style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]['name']),
            trailing: IconButton(
              icon : Icon(Icons.favorite, color: users[index]['isFavorite'] ? Colors.red : Colors.grey),
              onPressed: () {
                setState(() {
                  users[index]['isFavorite'] = !users[index]['isFavorite'];
                });
              },
            ),
          );
        },
      ),
    );
  }
}
