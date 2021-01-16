import 'package:flutter/material.dart';
import 'package:flutter_games/constant.dart';

class BuildExpandedCard extends StatelessWidget {

  final String label;
  final Function onTap;

  BuildExpandedCard({

    @required this.label,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: kCardColor,
          elevation: 7.8,
          child: Center(
            child: Text(
              label,
              style: kLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
