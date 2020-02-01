import 'package:flutter/material.dart';
import 'package:native_app/pages/home_page.dart';
import 'package:native_app/sidenav/sidenav.dart';

class SideNavLayout extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Stack(
            children: <Widget>[
                HomePage(),
                SideNav()
            ],
        );
    }
}