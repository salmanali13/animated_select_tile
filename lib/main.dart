import 'package:animated_select_tile/selectionList_Widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Selection List Example',
      home:  MyHomePage(title: 'Selection List Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedSelectionTile(selectionColor: Colors.green, unSelectedColor: Colors.blueGrey, text: "Select the tile -1", mainAxisAlignment: MainAxisAlignment.spaceBetween,tileBorder: 0,)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedSelectionTile(selectionColor: Colors.deepOrange, unSelectedColor: Colors.blueGrey, text: "Select the tile -2", mainAxisAlignment: MainAxisAlignment.spaceBetween,tileBorder: 10,)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedSelectionTile(selectionColor: Colors.deepPurpleAccent, unSelectedColor: Colors.blueGrey, text: "Select the tile -3", mainAxisAlignment: MainAxisAlignment.spaceBetween,tileBorder: 20,)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedSelectionTile(selectionColor: Colors.blue, unSelectedColor: Colors.blueGrey, text: "Select the tile -4",trailing: true, mainAxisAlignment: MainAxisAlignment.spaceBetween,tileBorder: 5,)),

          ],
        ),
      ),
     // railing comma makes auto-formatting nicer for build methods.
    );
  }
}
