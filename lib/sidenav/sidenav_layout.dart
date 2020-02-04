import 'package:flutter/material.dart';
import '../pages/home_page.dart';

import './sidenav.dart';

class SideNavLayout extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: <Widget>[
                    HomePage(),
                    SideNav()
                ],
            ),
        );
    }
}