import 'package:flutter/material.dart';
import "../../model/index.dart";

class MultiSelectionWidget extends StatefulWidget {
  QuestionObj questionObj;

  MultiSelectionWidget({Key? key, required this.questionObj}) : super(key: key);

  @override
  State<MultiSelectionWidget> createState() => _MultiSelectionWidgetState();
}

class _MultiSelectionWidgetState extends State<MultiSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
