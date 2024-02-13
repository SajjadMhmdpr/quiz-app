import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app_1/models/questions.dart';
import 'package:quiz_app_1/pages/point_screen.dart';
import 'package:quiz_app_1/widgets/alert_dialog.dart';
import 'package:quiz_app_1/widgets/base_widget.dart';
import 'package:quiz_app_1/widgets/my_button.dart';
import 'package:quiz_app_1/widgets/score_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key, required this.resultList});

  final List<int> resultList;

  String status = '';

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (resultList[0] > resultList[1]) {
      status = 'winner';
    } else {
      status = 'losser';
    }
    return BaseWidget(list: [
      //const SizedBox(height: 10,),
      Container(
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(50)),
          gradient: LinearGradient(colors: [
            status == 'winner' ? KGradientGreen : KRed2,
            Colors.white
          ], begin: Alignment.topCenter, end: Alignment.center),
        ),
        child: SizedBox(
          height: 560,
          width: MediaQuery.of(context).size.width - 60,
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              top: 80,
              child: Container(
                //height: 400,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text('you are $status !',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(
                      endIndent: 40,
                      indent: 40,
                      thickness: 3,
                      color: Colors.green,
                    ),
                    RowRes(Icons.check, 'correct', resultList[0], Colors.green),
                    RowRes(Icons.clear, 'wrong', resultList[1], Colors.red),
                    RowRes(Icons.check_box_outline_blank, 'white',
                        resultList[2], Colors.grey),
                  ],
                ),
              ),
            ),
            Positioned(top: 30, child: Image.asset('assets/images/sea.jpg')),
          ]),
        ),
      ),
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyButton(
              text: 'Play again',
              color: KOrang,
              onTap: () {
                //dialog(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return MyAlertDialog(onYesPress: (context) {
                      onYesPress(context);
                    }, onNoPress: (context) {
                      onNoPress(context);
                    });
                  },
                );
              }),
          MyButton(
              text: 'Results',
              color: Colors.white,
              onTap: () {
                AwesomeDialog(
                        context: context,
                        animType: AnimType.bottomSlide,
                        dialogType: DialogType.infoReverse,
                        headerAnimationLoop: false,
                        body: Column(
                          children: [
                            const Text(
                              'Enter your name : ',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                style: const TextStyle(fontSize: 25),
                                controller: textController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 5, color: Colors.red)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        btnOkOnPress: () {
                          onOkPress();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PointScreen(name: textController.text),
                              ));
                        },
                    btnCancelText: 'clr',
                    btnCancelOnPress: (){
                      clrList();
                    },
                        padding: const EdgeInsets.all(10),
                        buttonsTextStyle: const TextStyle(fontSize: 25))
                    .show();
              }),
        ],
      ),
      const SizedBox(
        height: 15,
      )
    ]);
  }

  void onYesPress(context) {
    Navigator.pop(context);
    Navigator.pop(context);

    for (var i in questions) {
      i.reset();
    }

    Phoenix.rebirth(context);
  }

  void onNoPress(context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  Widget RowRes(IconData icon, String text, int score, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(icon, size: 45, color: color),
        Text(text,
            style: TextStyle(
                fontSize: 38, fontWeight: FontWeight.bold, color: color)),
        Text(score.toString(),
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: color))
      ],
    );
  }

  void onOkPress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> list = pref.getStringList('Scores')??[];
    list.add('${textController.text}/${resultList[0]}/${resultList[1]}/${resultList[2]}');
    await pref.setStringList('Scores', list);

  }
  void clrList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('Scores', []);
  }
}
