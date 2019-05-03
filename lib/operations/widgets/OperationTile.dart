import 'package:flutter/material.dart';

class OperationTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;

  const OperationTile(this.iconData, this.title, this.description, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child:  Icon(iconData, size: 50,),),
          Flexible(child: Column(
            children: <Widget>[
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              Text(description, maxLines: 5)
            ],
          ),)
        ],
      ),
    );
  }
}
