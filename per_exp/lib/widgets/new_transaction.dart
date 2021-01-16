import 'package:flutter/material.dart';
import './user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty && enteredAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              // onChanged: (val) => titleInput = val,
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              // onChanged: (val) => amtInput = val,
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (value) {
                submitData();
              },
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              padding: EdgeInsets.all(25),
              onPressed: () {
                submitData();
              },
              child: Text('Add Transaction'),
              textColor: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
