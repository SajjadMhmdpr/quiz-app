import 'package:flutter/material.dart';
import 'package:quiz_app_1/constant.dart';
import 'package:quiz_app_1/widgets/base_widget.dart';
import 'package:quiz_app_1/widgets/score_list.dart';

class PointScreen extends StatelessWidget {
  const PointScreen({super.key, required this.name});
final String name;
  @override
  Widget build(BuildContext context) {
    return   BaseWidget(list: [
      Column(
        children: [
          const SizedBox(height: 60,),
          Center(child: Image.asset('assets/images/sea.jpg',height: 150,)),
          const SizedBox(height: 30,),
          Container(
            height: MediaQuery.of(context).size.height-240,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),

            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 20),
                        blurRadius: 10,
                        spreadRadius:4,
                      ),
                    ]

                  ),
                    child: const Row(
                      children: [
                        Text('user',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.check_box_outline_blank,size: 45, color: Colors.grey),
                        SizedBox(width: 5,),
                        Icon(Icons.clear,size: 45, color: Colors.red),
                        SizedBox(width: 5,),
                        Icon(Icons.check ,size: 45, color: Colors.green),
                      ],
                    ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: MediaQuery.of(context).size.height-350,
                  //height: MediaQuery.of(context).size.height-340,
                  child: ScoreList(),)


              ],
            ),
          ),

        ],
      ),
    ]);
  }
}


