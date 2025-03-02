import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text('Expense Tracker'),
        ],
      ), 
    );
  }
}
