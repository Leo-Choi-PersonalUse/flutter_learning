import 'package:flutter/material.dart';

class TimeLineNodeObj {
  String nodeCotent;
  String? name;
  String? date;
  String? time;
  TimeLineNodeType nodeType;

  TimeLineNodeObj({
    required this.nodeCotent,
    this.name,
    this.date,
    this.time,
    required this.nodeType,
  });
}

enum TimeLineNodeType { checked, current, pending, rejected }
