import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snake_game/blank_pixel_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum snake_Direction {UP, DOWN, LEFT, RIGT}

class _HomePageState extends State<HomePage> {

  int rowSize = 10;
  int totalNumberOfSquares = 100;

  List<int> snakePosition = [0, 1, 2];

  var currentDirection = snake_Direction.RIGT;

  int foodPosition = 36;

  void startGame() {
    Timer.periodic( const Duration(milliseconds: 300), (timer) {
      setState(() {
        moveSnake();
      });
    });
  }

  void moveSnake () {
    switch(currentDirection) {
      case snake_Direction.UP:
        {
          if(snakePosition.last < rowSize) {
            snakePosition.add(snakePosition.last - rowSize + totalNumberOfSquares);
          } else {
            snakePosition.add(snakePosition.last - rowSize);
          }
          snakePosition.removeAt(0);
        }
        break;
      case snake_Direction.DOWN:
      {

        if(snakePosition.last + rowSize > totalNumberOfSquares) {
          snakePosition.add(snakePosition.last + rowSize - totalNumberOfSquares);
        }else {
          snakePosition.add(snakePosition.last + rowSize);
        }
        snakePosition.removeAt(0);
      }
        break;
      case snake_Direction.RIGT:
      {
        if(snakePosition.last % rowSize == 9) {
          snakePosition.add(snakePosition.last + 1 - rowSize);
        }else {
          snakePosition.add(snakePosition.last + 1);
        }
        snakePosition.removeAt(0);
      }
        break;
      case snake_Direction.LEFT:
      {
        if (snakePosition.last % rowSize == 0){
          snakePosition.add(snakePosition.last - 1 + rowSize);
        }else {
          snakePosition.add(snakePosition.last -1);
        }
        snakePosition.removeAt(0);
      }
        break;
    }
  }


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
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if(details.delta.dy < 0 && currentDirection != snake_Direction.DOWN) {
                  currentDirection = snake_Direction.UP;
                 } else if (  currentDirection != snake_Direction.UP) {
                    currentDirection = snake_Direction.DOWN;
                 }
                },
              onHorizontalDragUpdate: (details) {
                if(details.delta.dx < 0 && currentDirection != snake_Direction.RIGT)  {
                  currentDirection = snake_Direction.LEFT;
                  } else if (currentDirection != snake_Direction.LEFT) {
                    currentDirection = snake_Direction.RIGT;
                  }
                },
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
              ),
            )),

          //play button
          Expanded(child: Center(
            child: MaterialButton(
              child: const Text('PLAY'),
              color: Colors.white,
              onPressed:() => startGame(),
            ),
          ),),
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