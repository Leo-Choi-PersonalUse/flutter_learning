import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import './FormBuilderGenerator.dart';

class AppFormBuilder extends StatefulWidget {
  const AppFormBuilder({Key? key}) : super(key: key);

  @override
  State<AppFormBuilder> createState() => _AppFormBuilderState();
}

class _AppFormBuilderState extends State<AppFormBuilder> {
  final _formKey = GlobalKey<FormBuilderState>();
  var form = FormBuilderGenerator("a");
  List<Widget> rendering = [];



  @override
  void initState() {
    super.initState();
    rendering = form.rendering;
    //initFormBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Form Builder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: rendering,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}