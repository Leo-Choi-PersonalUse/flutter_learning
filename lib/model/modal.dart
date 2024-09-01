import 'package:flutter/material.dart';
import 'package:flutter_learning/theme/AppTheme.dart';

abstract class Modal extends StatefulWidget {
  double? height;
  Widget content;

  Modal({Key? key, required this.content, this.height});
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
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
