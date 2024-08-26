import 'package:flutter/material.dart';
import 'Navigate.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import './ApplicationFormPage.dart';
import './AppFormBuilder.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //List<String> items = ["Application Form", "Setting", "Menu","Form Builder",'Modal'];

  List<dynamic> items = [
    {
      "name": "Application Form",
      "content": ApplicationFormPage(),
    },
    {
      "name": "Setting",
      "content": ApplicationFormPage(),
    },
    {
      "name": "Menu",
      "content": ApplicationFormPage(),
    },
    {
      "name": "Form Builder",
      "content": AppFormBuilder(),
    },
    {
      "name": "Modal",
      "content": AppFormBuilder(),
    }
  ];

  double itemGap = 5.0;



  void showBottomSheet(){
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Edit'),
            leading: Icon(Icons.edit),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Copy'),
            leading: Icon(Icons.content_copy),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Cut'),
            leading: Icon(Icons.content_cut),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Move'),
            leading: Icon(Icons.folder_open),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Delete'),
            leading: Icon(Icons.delete),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Edit'),
            leading: Icon(Icons.edit),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Copy'),
            leading: Icon(Icons.content_copy),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Cut'),
            leading: Icon(Icons.content_cut),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Move'),
            leading: Icon(Icons.folder_open),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Delete'),
            leading: Icon(Icons.delete),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }


  void navigateToNewPage(index) {
    if(items[index]["name"] == "Modal")
      showBottomSheet();
    else
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
            // Replace Navigrate with the desired destination page
            items[index]["content"]
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Handle item tap here
                navigateToNewPage(index);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Text(items[index]["name"]),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: itemGap);
          },
        ));
  }
}
