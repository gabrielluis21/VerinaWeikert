// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verinna_weikert_test_frontend/src/controllers/clients.controller.dart';
import 'package:verinna_weikert_test_frontend/src/models/clients.dart';
import 'package:verinna_weikert_test_frontend/src/views/clients-screen/client-form/client.form.screen.dart';
import 'package:verinna_weikert_test_frontend/src/views/clients-screen/widgets/clients.card.widget.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  late Clientes clientes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clientes'),),
      body: GetX<ClientsController>(
        init: Get.put(ClientsController()),
        builder: (controller) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: ListView.builder(
              itemCount: controller.all.length, 
              itemBuilder: (context, index){
               if(controller.all.isEmpty){
                return ListTile(title: Text("Sem clientes"),);
               }else{
                return ClientsCard(clientes: controller.all[index]);
               }
              }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ClientFormScreen(
          controller: Get.put<ClientsController>(ClientsController()))));
      }, child: Icon(Icons.add)),
    );
  }
}