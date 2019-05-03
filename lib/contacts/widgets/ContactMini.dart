import 'package:flutter/material.dart';
import '../ContactData.dart';

class ContactMini extends StatelessWidget {
  final ContactData contact;

  const ContactMini(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/defaultUser.png'))),
        ),
        Text('${contact.name} ${contact.lastName}', textAlign: TextAlign.center,)
      ],
    );
  }
}
