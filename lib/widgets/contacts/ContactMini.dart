import 'package:cdonline/models/Contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactMini extends StatelessWidget {
  const ContactMini({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact contact = Provider.of<Contact>(context);
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
