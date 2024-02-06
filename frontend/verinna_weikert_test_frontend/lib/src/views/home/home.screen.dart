// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScren extends StatelessWidget {
  const HomeScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verina Test"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[200],
                fixedSize: Size(327, 60)
              ), child: Text("Clientes"),),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                fixedSize: Size(327, 60)
              ), child: Text("Tags"),),
        
            ],
          ),
      ),
    );
  }
}