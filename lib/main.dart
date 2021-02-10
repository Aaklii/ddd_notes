// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#

import 'package:flutter/material.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// * Start of main()
void main() => runApp(MyApp());

// ***************************END***************************

// * Start of MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

// ***************************END***************************












//  * Start of Country Model
//  ? Fields
//  ***************************END***************************
