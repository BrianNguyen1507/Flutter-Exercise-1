// ignore: file_names
import 'package:flutter/material.dart';

class ProductListing extends StatelessWidget {
  const ProductListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Product Listing",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: const <Widget>[
          ProductBox(
            name: "Coca cola",
            description: "this is a famous drink",
            image: "assets/images/coca.jpg",
            price: 1000,
          ),
          ProductBox(
            name: "laptop",
            description: "this is a famous latop",
            image: "assets/images/laptop.png",
            price: 1000,
          ),
          ProductBox(
            name: "mouse",
            description: "this is a famous mouse",
            image: "assets/images/mouse.jpg",
            price: 1000,
          ),
          ProductBox(
            name: "phone",
            description: "this is a famous phone",
            image: "assets/images/phone.jpg",
            price: 1000,
          ),
          ProductBox(
            name: "Coca cola",
            description: "this is a famous drink",
            image: "assets/images/coca.jpg",
            price: 1000,
          ),
          ProductBox(
            name: "Coca cola",
            description: "this is a famous drink",
            image: "assets/images/coca.jpg",
            price: 1000,
          ),
          ProductBox(
            name: "Coca cola",
            description: "this is a famous drink",
            image: "assets/images/coca.jpg",
            price: 1000,
          ),
          ProductBox(
            name: "Coca cola",
            description: "this is a famous drink",
            image: "assets/images/coca.jpg",
            price: 1000,
          ),
          ProductBox(
            name: "Coca cola",
            description: "this is a famous drink",
            image: "assets/images/coca.jpg",
            price: 1000,
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  final String name;
  final String description;
  final String image;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        color: Colors.transparent,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: Image.asset(
              image,
              height: 90.0,
              width: 80.0,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                description,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
