import 'package:apitest/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ErrorMessageWithRetry extends StatelessWidget {
  const ErrorMessageWithRetry({
    super.key,
    required this.message,
    required this.onRetryPressed,
    this.retryLabel,
  });

  final String message;
  final ValueSetter<BuildContext> onRetryPressed;
  final String? retryLabel;

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
                onPressed: () => onRetryPressed(context),
                child: Text(retryLabel ?? context.l10n.retry),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
