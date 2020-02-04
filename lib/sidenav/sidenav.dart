import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {

    bool openSideNav = false;

    @override
    Widget build(BuildContext context) {

        final screenWidth = MediaQuery.of(context).size.width;

        return Positioned(
            top: 0,
            bottom: 0,
            left: openSideNav ? 0 : 0,
            right: openSideNav ? 0 : screenWidth - 45,
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: Container(
                            color: Color(0xFF27A09E),
                            // color: Color(0xFF205374),
                            // color: Color(0xFF262AAA),
                        ),
                    ),
                    Align(
                        alignment: Alignment(0, -0.9),
                            child: Container(
                            width: 35.0,
                            height: 110.0,
                            color: Color(0xFF27A09E),
                        )
                    )
                    
                ],
            ),

        );
    }
}