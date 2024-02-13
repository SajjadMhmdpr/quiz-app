import 'package:flutter/material.dart';

import 'my_button.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key, required this.onYesPress, required this.onNoPress});

   final void Function(BuildContext context) onYesPress;
  final void Function(BuildContext context) onNoPress;

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text('Are you sure to exit this page ?',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
      )),
      icon: const Icon(Icons.info_outline_rounded,color: Colors.lightBlueAccent,size: 80),
      iconPadding: EdgeInsets.only(top: 5,bottom: 15),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 2,child: MyButton(text: 'Yes', color: Colors.green, onTap: (){
            onYesPress(context);
          })),
          const SizedBox(width: 10,),
          Expanded(flex: 2,child: MyButton(text: 'No', color: Colors.redAccent, onTap: (){
            onNoPress(context);
          })),
        ],
      ),
      iconColor: Colors.green,

    );
  }
}
