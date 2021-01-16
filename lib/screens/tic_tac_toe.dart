import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool isCross = true;
  List<String> gameState;
  String message = "";
  bool isDisabled = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.message = "CROSS turn";
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
    });
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        if (this.isCross) {
          this.message = "CROSS turn";
        } else {
          this.message = "CIRCLE turn";
        }
        this.checkWin();
      });
    }
  }

  resetGame() {
    setState(() {
      this.message = this.isCross ? "CROSS turn" : "CIRCLE turn";
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
      this.isDisabled = false;
    });
  }

  IconData getIcon(index) {
    if (gameState[index] == 'cross')
      return Icons.close;
    else
      return Icons.circle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            _buildBoard(context),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    onPressed: () {
                      this.resetGame();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      "Reset Game",
                      style: TextStyle(
                        fontSize: 21,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoard(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 7,
            mainAxisSpacing: 8,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, index) {
            return RaisedButton(
              onPressed: isDisabled
                  ? null
                  : () {
                      this.playGame(index);
                    },
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: this.gameState[index] == 'empty'
                  ? Container()
                  : Icon(
                      this.getIcon(index),
                      size: 50.0,
                    ),
            );
          },
        ),
      ),
    );
  }

  checkWin() {
    // 0 1 2
    // 3 4 5
    // 6 7 8

    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = "${this.gameState[3]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[6]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = "${this.gameState[1]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
        this.isDisabled = true;
      });
    }
    if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[2] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
        this.isDisabled = true;
      });
    }

    if (!gameState.contains("empty")) {
      setState(() {
        this.message = "Game draw";
      });
    }
  }
}
