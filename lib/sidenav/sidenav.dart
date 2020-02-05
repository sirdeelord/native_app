import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideNav extends StatefulWidget {
    @override
  _SideNavState createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> 
    with SingleTickerProviderStateMixin<SideNav> {

    AnimationController _animationController;
    final _animationDuration = const Duration(milliseconds: 500);
    StreamController<bool> openSideNavStreamController;
    Stream<bool> openSideNavStream;
    StreamSink<bool> openSideNavSink;

    @override
    void initState() {
        super.initState();
        _animationController = AnimationController(vsync: this, duration: _animationDuration);
        openSideNavStreamController = PublishSubject<bool>();
        openSideNavStream = openSideNavStreamController.stream;
        openSideNavSink = openSideNavStreamController.sink;
    }

    @override
    void dispose() {
        _animationController.dispose();
        openSideNavStreamController.close();
        openSideNavSink.close();
        super.dispose();
    }

    void onIconPressed() {
        final animationStatus = _animationController.status;
        final animationCompleted = animationStatus == AnimationStatus.completed;

        if (animationCompleted) {
            openSideNavSink.add(false);
            _animationController.reverse();
        } 
        else {
            openSideNavSink.add(true);
            _animationController.forward();
        }
    }

    @override
    Widget build(BuildContext context) {

        final screenWidth = MediaQuery.of(context).size.width;

        return StreamBuilder<bool>(
            initialData: false,
            stream: openSideNavStream,
            builder: (context, sideNavOpenAsync) {
                return AnimatedPositioned(
                    duration: _animationDuration,
                    top: 0,
                    bottom: 0,
                    left: sideNavOpenAsync.data ? 0 : -screenWidth,
                    right: sideNavOpenAsync.data ? 0 : screenWidth - 45.0,
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: Container(
                                    color: Color(0xFF27A09E),
                                    child: Column(
                                        children: <Widget>[
                                            SizedBox(height: 100),
                                            ListTile(
                                                title: Text('Saddy', 
                                                    style: TextStyle(
                                                        fontFamily: 'Spacemono',
                                                        color: Colors.white,
                                                        fontSize: 30.0,
                                                        fontWeight: FontWeight.w800,
                                                    ),
                                                ),
                                                subtitle: Text('sodugbesan@example.io',
                                                    style: TextStyle(
                                                        fontFamily: 'Spacemono',
                                                        color: Color(0xFFD3F5CE),
                                                        fontSize: 20.0,
                                                        fontWeight: FontWeight.w100
                                                    ),
                                                ),
                                                leading: CircleAvatar(
                                                    // child: Text('S.O',
                                                    //     style: TextStyle(
                                                    //         fontFamily: 'Spacemono',
                                                    //         // color: Color(0xFF27A09E),
                                                    //         color: Colors.white,
                                                    //         fontSize: 20.0,
                                                    //         fontWeight: FontWeight.w100
                                                    //     ),
                                                    // ),
                                                    child: Icon(
                                                        Icons.perm_identity,
                                                        color: Color(0xFFD3F5CE),
                                                    ),
                                                     radius: 30,
                                                ),
                                                
                                            ),
                                            Divider(
                                                height: 64.0,
                                                thickness: 0.5,
                                                color: Color(0xFFD3F5CE),
                                            )
                                        ]
                                    ),
                                ),
                            ),
                            Align(
                                alignment: Alignment(0, -0.9),
                                child: GestureDetector(
                                    onTap: () {
                                        onIconPressed();
                                    },
                                    child: Container(
                                        width: 35.0,
                                        height: 110.0,
                                        color: Color(0xFF27A09E),
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedIcon(
                                            progress: _animationController.view,
                                            icon: AnimatedIcons.menu_close,
                                            color: Color(0xFFD3F5CE),
                                            size: 25.0,
                                        ),
                                    )
                                ),
                            )
                        ],
                    ),
                );
            }   
        );
    }
}