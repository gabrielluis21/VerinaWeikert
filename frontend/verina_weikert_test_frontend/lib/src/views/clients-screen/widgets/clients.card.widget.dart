import 'package:flutter/material.dart';
import 'package:verina_weikert_test_frontend/src/controllers/clients.controller.dart';
import 'package:verina_weikert_test_frontend/src/models/clients.dart';
import 'package:verina_weikert_test_frontend/src/views/clients-screen/client-form/client.form.screen.dart';

class ClientsCard extends StatelessWidget {
  const ClientsCard({super.key, this.clientes, this.controller});

  final Clientes? clientes;
  final ClientsController? controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(clientes?.id != null ? 'Id: ${clientes?.id}' : ''),
            Text(clientes?.email != null ? 'Name: ${clientes?.email}': '')
          ],
        ),
        subtitle: Text('Tag: ${clientes?.tag?.name}'),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ClientFormScreen(
                controller: controller, 
                data: clientes,
              ),
            ),
          );
        },);
  }
}