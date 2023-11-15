

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TradeButton extends HookWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Button 1 action
              },
              child: Text('Button 1'),
            ),
          ),
          SizedBox(width: 10), // Corrected the class name to `SizedBox`
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Button 2 action
              },
              child: Text('Button 2'),
            ),
          ),
        ],
      ),
    );
  }

}