import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String userName;
  final String message;
  final bool belongsToMe;

  const MessageBubble({
    @required this.key,
    @required this.message,
    @required this.userName,
    @required this.belongsToMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color:
                belongsToMe ? Colors.grey[300] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft:
                  belongsToMe ? Radius.circular(12) : Radius.circular(0),
              bottomRight:
                  belongsToMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 140,
          margin: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 8.0,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                message,
                style: TextStyle(
                  color: belongsToMe
                      ? Colors.black
                      : Theme.of(context).accentTextTheme.headline1.color,
                ),
                textAlign: belongsToMe ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
