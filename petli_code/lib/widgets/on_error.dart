import 'package:flutter/material.dart';

class OnError extends StatelessWidget {
  OnError(
    this.error, {
    this.callback,
  });

  final String error;

  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error),
          const SizedBox(height: 20),
          Text(error),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => callback != null ? callback : null,
            child: Text('Try load data again...'),
          )
        ],
      ),
    );
  }
}
