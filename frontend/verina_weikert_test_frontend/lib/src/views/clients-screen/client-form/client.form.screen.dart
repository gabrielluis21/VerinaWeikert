// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/controllers/clients.controller.dart';
import 'package:verina_weikert_test_frontend/src/controllers/tags.controller.dart';
import 'package:verina_weikert_test_frontend/src/models/clients.dart';
import 'package:verina_weikert_test_frontend/src/models/tags.dart';

class ClientFormScreen extends StatefulWidget {
  const ClientFormScreen({super.key, required this.controller, this.data});

  final ClientsController? controller;
  final Clientes? data;

  @override
  State<ClientFormScreen> createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends State<ClientFormScreen> {
  dynamic client, tag;
  final _formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();

  @override
  void initState() {
    if(widget.data != null){
      emailTextController.text = widget.data!.email!;
      client = widget.data;
      tag = widget.data?.tag;
    }
    super.initState();
  }

  List<DropdownMenuItem<Tags>>_buildDropdownItems(){
    return List<DropdownMenuItem<Tags>>.from(
      Get.find<TagsController>(tag: 'tagsController')
        .all.map(
          (element) => DropdownMenuItem<Tags>(
            value: element, onTap: () =>tag = element, child: Text('${tag.name}'),
          )
        )
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: client.isBlank ? Text("Crie uma nova tag") : Text('${client?.name}'),
      ) ,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 450,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(),
              Spacer(),
              DropdownButtonFormField<Tags>(
                items: _buildDropdownItems(),
                value: tag != null ? Tags() : tag,
                onChanged: (value) => setState(() {
                  if(client != null){
                    client.tag = value;
                  }else{
                    client = Clientes(tag: Tags());
                  }
                }),
              ),
              Spacer(),
              ElevatedButton(onPressed: (){
               // if(_formKey.currentState.validate()){}
               if(client == null){
                client.name = emailTextController.text; 
                widget.controller?.add(client);
               }else{
                widget.controller?.alter(client);
               }
              }, child: Text('Salvar'))
            ],
          ),),
        ),
      ),
    );
  }
}