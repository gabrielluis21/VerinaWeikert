// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verina_weikert_test_frontend/src/controllers/tags.controller.dart';

import 'tag-form/tags.form.screen.dart';
import 'widgets/tags.card.widget.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({super.key});

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clientes'),),
      body: GetX<TagsController>(
        init: Get.put(TagsController()),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: ListView.builder(
              itemCount: controller.all.length, 
              itemBuilder: (context, index){
               if(controller.all.isEmpty){
                return ListTile(title: Text("Sem tags"),);
               }else{
                return TagsCard(tag: controller.all[index], controller: controller,);
               }
              }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => TagsFormScreen(controller: Get.put<TagsController>(TagsController()),)
          ),
        );
      }, child: Icon(Icons.add)),
    );
  }
}