import 'package:flutter/material.dart';
import 'package:flutter_learning/theme/AppTheme.dart';

class ModalTemplate extends StatefulWidget {
  double? height;
  Widget content;

  ModalTemplate({super.key, required this.content, this.height});

  @override
  State<ModalTemplate> createState() => _ModalTemplateState();
}

class _ModalTemplateState extends State<ModalTemplate> {
  @override
  void initState() {
    super.initState();
    //childHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - kToolbarHeight - 30,
      ),
      height:
          widget.height == null ? null : MediaQuery.of(context).size.height * widget.height!, //MediaQuery.of(context).size.height * widget.height!,
      color: AppTheme.of(context).primaryBackground,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: Container(
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
          ),
          Expanded(
            child: Container(
              color: AppTheme.of(context).primaryBackground,
              child: widget.content,
            ),
          ),
        ],
      ),
    );
  }

// void childHeight() {
//   if (widget.content is SizedBox) {
//     print((widget.content as SizedBox).height);
//   } else if (widget.content is Container) {
//     print((widget.content as Container).constraints?.maxHeight);
//   } else {
//     print('Content height is not directly accessible');
//   }
// }
}
