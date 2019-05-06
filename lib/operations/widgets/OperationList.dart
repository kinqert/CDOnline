import 'package:cdonline/operations/widgets/CreditTile.dart';
import 'package:flutter/material.dart';

import '../Credit.dart';
import '../Operation.dart';

class OperationList extends StatelessWidget {
  final List<Operation> operations;
  const OperationList(this.operations, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        itemCount: operations.length,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    if (operations[index] is Credit) {
      return Container(
          padding: EdgeInsets.all(10), child: CreditTile(operations[index]));
    }
    return null;
  }
}
