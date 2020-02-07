import 'package:flutter/material.dart';

class SideNavItems extends StatelessWidget {

    final IconData icon;
    final String title;
    final Function onTap;

    const SideNavItems({Key key, this.icon, this.title, this.onTap}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: onTap,
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                    children: <Widget>[
                        Icon(
                            icon,
                            color: Color(0xFFD3F5CE),
                            size: 30
                        ),
                        SizedBox(width: 16),
                        Text(
                            title,
                            style: TextStyle(
                                fontFamily: 'Spacemono',
                                fontWeight: FontWeight.w300,
                                fontSize: 24,
                                color: Colors.white
                            ),
                        )
                    ],
                ),
            )
        );
    }
}
