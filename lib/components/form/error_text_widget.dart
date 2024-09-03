import 'package:flutter/material.dart';
import 'package:flutter_learning/theme/AppTheme.dart';

class ErrorTextWidget extends StatelessWidget {
  FormFieldState state;

  ErrorTextWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(13, 10, 0, 0),
          child: Text(
            state.errorText!,
            style: TextStyle(
              color: AppTheme.of(context).error,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
