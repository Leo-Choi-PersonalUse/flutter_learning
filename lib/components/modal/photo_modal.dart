import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'modal_template.dart';

class PhotoModal extends StatefulWidget {
  const PhotoModal({super.key});

  @override
  State<PhotoModal> createState() => _PhotoModalState();
}

class _PhotoModalState extends State<PhotoModal> {
  @override
  Widget build(BuildContext context) {
    return ModalTemplate(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: ListTile(
                title: Text('相機'),
                leading: Icon(Icons.camera_alt),
                onTap: () async {
                  XFile? files = await ImagePicker().pickImage(source: ImageSource.camera);
                  Navigator.of(context, rootNavigator: true).pop(files != null ? [files] : []);
                },
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('相片'),
                leading: Icon(Icons.photo),
                onTap: () async {
                  List<XFile>? files = await ImagePicker().pickMultiImage();
                  Navigator.of(context, rootNavigator: true).pop(files ?? []);
                },
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('刪除'),
                leading: Icon(Icons.delete_outline),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消1'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消2'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消3'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消4'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消1'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消2'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消3'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消4'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消1'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消2'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消3'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Flexible(
              child: ListTile(
                title: Text('取消4'),
                leading: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            // Add more ListTiles as needed
          ],
        ),
      ),
    );
  }
}
