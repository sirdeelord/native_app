import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text('Home Page',
                style: TextStyle(
                    fontFamily: 'Spacemono',
                    fontWeight: FontWeight.w900,
                    fontSize: 28
                )
            )
        );
    }
}