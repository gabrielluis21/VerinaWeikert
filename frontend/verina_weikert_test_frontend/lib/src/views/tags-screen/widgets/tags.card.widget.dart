import 'package:flutter/material.dart';
import 'package:verina_weikert_test_frontend/src/controllers/tags.controller.dart';
import 'package:verina_weikert_test_frontend/src/models/tags.dart';
import 'package:verina_weikert_test_frontend/src/views/tags-screen/tag-form/tags.form.screen.dart';

class TagsCard extends StatelessWidget {
  const TagsCard({super.key, this.tag, required this.controller});

  final Tags? tag;
  final TagsController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tag?.id != null ? 'Id: ${tag?.id}' : ''),
            Text(tag?.name != null ? 'Name: ${tag?.name}': '')
          ],
        ),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TagsFormScreen(
                controller: controller, 
                data: tag,
              ),
            ),
          );
        },);
  }
}