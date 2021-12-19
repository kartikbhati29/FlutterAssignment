import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageExample extends StatefulWidget {
  const PageExample({ Key? key}) : super(key: key);

  @override
  _PageExampleState createState() => _PageExampleState();
}

class _PageExampleState extends State<PageExample> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<Offset> offset;
  List<Widget> pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
  ];

  @override
   void initState(){

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0,1),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticIn,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:

      SlideTransition(
              position: offset,
              child: const Padding(
                padding: EdgeInsets.all(50.0),
                child: CircularProgressIndicator(),
              ),
            ),

    );
  }
}
