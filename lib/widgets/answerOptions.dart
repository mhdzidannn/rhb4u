import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhb4u/notifier/questionNotifier.dart';

class Option extends StatelessWidget {
  
  final String text;
  final int index;
  final VoidCallback press;

  Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionNotifier>(
        builder: (context, notifier, widget) {

          Color getTheRightColor() {
            if (notifier.isAnswered) {
              if (index == notifier.correctAns) {
                return Colors.green;
              } else if (index == notifier.selectedAns &&
                  notifier.selectedAns != notifier.correctAns) {
                return Colors.red;
              }
            }
            return Colors.blue;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              width: 200,
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text   ",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == Colors.blue
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == Colors.blue
                        ? null
                        : Icon(getTheRightIcon(), size: 16),
                  )
                ],
              ),
            ),
          );
        });
  }
}