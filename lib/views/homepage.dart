import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: todo
  //TODO: link up the Images
  bool isCross = true;
  String message = "No wins";
  List<String> gameState = [];
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  //TODO: Initalize the state of my Box/columns with Empty value

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }
  //TODO: Play Game Method

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  //TODO: Get Image Method
  getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;
      case ("cross"):
        return cross;
      case ("circle"):
        return circle;
    }
  }

  // Check for Wining Logic
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        message = '${gameState[0]} Wins';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        message = '${gameState[3]} Wins';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        message = '${gameState[6]} Wins';
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        message = '${gameState[1]} Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        message = '${gameState[0]} Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        message = '${gameState[2]} Wins';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[4]) &&
        (gameState[4] == gameState[2])) {
      setState(() {
        message = '${gameState[6]} Wins';
      }); 
    } else if (!gameState.contains("empty")) {
      message = 'Match Has been Drwan';
    }
  }

  //ResetGame Method
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                  height: 70.0,
                  width: 70.0,
                  child: MaterialButton(
                      hoverElevation: 28.0,
                      //color: Colors.deepPurple,
                      onPressed: () {
                        playGame(i);
                      },
                      child: Image(
                        image: getImage(this.gameState[i]),
                      ),
                      elevation: 5.0,
                      splashColor: Colors.deepPurpleAccent,
                      shape: Border.all())),
            ),
          ),
          Container(
            padding: EdgeInsets.all(50.0),
            child: Text(this.message,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45)),
          ),
          MaterialButton(
            color: Colors.purpleAccent,
            minWidth: 250.0,
            height: 50,
            onPressed: () {
              resetGame();
            },
            padding: EdgeInsets.all(15.0),
            child: Text("Reset Game",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     resetGame();
      //   },
      //   child: Icon(Icons.redo),
      // ),
    );
  }
}
