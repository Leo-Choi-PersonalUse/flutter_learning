import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class PhotoModal extends StatefulWidget {
  const PhotoModal({super.key});

  @override
  State<PhotoModal> createState() => _PhotoModalState();
}

class _PhotoModalState extends State<PhotoModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('相機'),
          leading: Icon(Icons.camera_alt),
          onTap: () async {
            XFile? files = await ImagePicker().pickImage(source: ImageSource.camera);
            Navigator.of(context, rootNavigator: true).pop(files != null ? [files] : []);
          },
        ),
        ListTile(
          title: Text('相片'),
          leading: Icon(Icons.photo),
          onTap: () async {
            List<XFile>? files = await ImagePicker().pickMultiImage();
            Navigator.of(context, rootNavigator: true).pop(files ?? []);
          },
        ),
        ListTile(
          title: Text('刪除'),
          leading: Icon(Icons.delete_outline),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          title: Text('取消'),
          leading: Icon(Icons.cancel),
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
