// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:verina_weikert_test_frontend/src/controllers/tags.controller.dart';
import 'package:verina_weikert_test_frontend/src/models/tags.dart';

class TagsFormScreen extends StatefulWidget {
  const TagsFormScreen({super.key, required this.controller, this.data});

  final TagsController? controller;
  final Tags? data;

  @override
  State<TagsFormScreen> createState() => _TagsFormScreenState();
}

class _TagsFormScreenState extends State<TagsFormScreen> {
  dynamic tag;
  final _formKey = GlobalKey<FormState>();
  final nameTag = TextEditingController();
  @override
  void initState() {
    if(widget.data != null){
      tag = widget.data;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tag.isBlank ? Text("Crie uma nova tag") : Text('${tag?.name}'),
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
              TextFormField(controller: nameTag,),
              Spacer(),
              ElevatedButton(onPressed: (){
               // if(_formKey.currentState.validate()){}
              if(tag == null){
                tag = Tags(name: '');
                widget.controller?.add(tag);
               }else{
                widget.controller?.alter(tag);
               }
              }, child: Text('Salvar'))
            ],
          ),),
        ),
      ),
    );
  }
}