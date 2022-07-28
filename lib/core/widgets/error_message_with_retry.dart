import 'package:flutter/material.dart';

class ErrorMessageWithRetry extends StatelessWidget {
  const ErrorMessageWithRetry({
    super.key,
    required this.message,
    required this.onRetryPressed
});

  final String message;
  final ValueSetter<BuildContext> onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MaterialButton(
                  onPressed: () => onRetryPressed,
                child: const Text('Retry'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
