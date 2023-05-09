import 'package:flutter/material.dart';
import 'package:restaurant_app/component/detail-component.dart';

class DetailRestaurant extends StatelessWidget {
  final String id;

  const DetailRestaurant({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restourant",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: DetailComponent(id: id),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
    );
  }
}
