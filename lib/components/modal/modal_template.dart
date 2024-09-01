import 'package:flutter/material.dart';
import 'package:flutter_learning/theme/AppTheme.dart';

class ModalTemplate extends StatefulWidget {
  Widget content;

  ModalTemplate({super.key, required this.content});

  @override
  State<ModalTemplate> createState() => _ModalTemplateState();
}

class _ModalTemplateState extends State<ModalTemplate> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 1,
        //set this as you want
        maxChildSize: 1,
        //set this as you want
        minChildSize: 1,
        //set this as you want
        expand: true,
        builder: (context, scrollController) {
          return Container(
            color: AppTheme.of(context).primaryBackground,
            child: Text("aaaa"),
          ); //whatever you're returning, does not have to be a Container
        });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: AppTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          child: Center(
            child: Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: AppTheme.of(context).primaryBackground,
            child: widget.content,
          ),
        ),
      ],
    );
  }
}
