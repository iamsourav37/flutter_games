import 'package:flutter/material.dart';
import 'package:flutter_games/components/BuildExpandedCard.dart';
import 'package:flutter_games/constant.dart';
import 'package:flutter_games/screens/tic_tac_toe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Games"),
      ),
      drawer: this._buildDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BuildExpandedCard(
              label: 'Tic Tac Toe',
              onTap: () {
                debugPrint("navigate to Tic Tac Toe screen");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TicTacToe();
                    },
                  ),
                );
              },
            ),
            BuildExpandedCard(
              label: 'Scratch & Win',
              onTap: () {
                debugPrint("navigate to Scratch & Win screen");
              },
            ),
            BuildExpandedCard(
              label: 'Dice Roller',
              onTap: () {
                debugPrint("navigate to Dice Roller screen");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60.0,
                    child: Text(
                      "SG",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sourav Ganguly",
                    style: kLabelStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          ListTile(
            onTap: () {
              debugPrint("Navigate to Tic Tac Toe screen ");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TicTacToe();
                  },
                ),
              );
            },
            title: Text(
              "Tic Tac Toe",
              style: kListTileTextStyle,
            ),
            trailing: Icon(Icons.games_sharp),
          ),
          ListTile(
            onTap: () {
              debugPrint("Navigate to Scratch & Win screen ");
            },
            title: Text(
              "Scratch & Win",
              style: kListTileTextStyle,
            ),
            trailing: Icon(Icons.games_sharp),
          ),
          ListTile(
            onTap: () {
              debugPrint("Navigate to Dice Roller screen ");
            },
            title: Text(
              "Dice Roller",
              style: kListTileTextStyle,
            ),
            trailing: Icon(Icons.games_sharp),
          ),
        ],
      ),
    );
  }
}
