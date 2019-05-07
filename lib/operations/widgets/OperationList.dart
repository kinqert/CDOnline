import 'package:cdonline/operations/widgets/OperationCell.dart';
import 'package:flutter/material.dart';

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
    return Container(
      padding: EdgeInsets.all(10), child: OperationCell(operations[index]));
  }
}
