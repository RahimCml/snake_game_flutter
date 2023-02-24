import 'package:flutter/material.dart';
import 'package:snake_game/blank_pixel_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int rowSize = 10;
  int totalNumberOfSquares = 100;

  List<int> snakePosition = [0, 1, 2];

  int foodPosition = 36;


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
              if(snakePosition.contains(index)) {
                return _snakePixel();
              } else if(foodPosition == index) {
                return _foodPixel();
              }
               else {
                return const BlankPixelStyle();
              }
            }
            )),

          //play button
          Expanded(child: Container(),),
        ],
      ),
    );
  }
  Widget _snakePixel() {
    return Padding(padding: const EdgeInsets.all(2),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    ),);
  }
  Widget _foodPixel() {
    return Padding(padding: const EdgeInsets.all(2),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(4),
      ),
    ),);
  }
}