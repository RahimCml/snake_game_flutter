import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:snake_game/pixel_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int rowSize = 10;
  int totalNumberOfSquares = 100;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //collected scores
          Expanded(child: Container(),),
  
          //game grid
          Expanded(
            flex: 3,
            child: GridView.builder(
            itemCount: totalNumberOfSquares,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: rowSize),
            itemBuilder: (context, index) {
              return const PixelStyle();
            }
            )),


          //play button
          Expanded(child: Container(),),
        ],
      ),
    );
  }
}