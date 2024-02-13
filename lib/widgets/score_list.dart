import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class ScoreList extends StatelessWidget {
  const ScoreList({super.key});

  @override
  Widget build(BuildContext context) {

    return
       FutureBuilder(
        future: getScores() ,
        builder: (context, snapshot) {
          if(snapshot.hasData&& snapshot.connectionState==ConnectionState.done)
            {
              List<String>list = snapshot.data??[];

              
              return ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Color color;
                  if(int.parse(list[index].split('/')[1])>int.parse(list[index].split('/')[2]) ){
                      color = Colors.greenAccent;
                  }
                  else{
                        color=KRedGrad;
                  }
                  //return Text('${snapshot.data?[index].split('/')[0]}');
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
                    margin: const EdgeInsets.only(left: 10,top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(50)),
                      gradient: LinearGradient(
                          colors: [color,Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          stops: const [0.1,0.99]),
                    ),
                    child:  Row(
                      children: [
                        Text(list[index].split('/')[0],
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Text(list[index].split('/')[3],
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold,
                              color: Colors.grey),),
                        const SizedBox(width: 20,),
                        Text(list[index].split('/')[2],
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold,
                              color: Colors.red),),
                        const SizedBox(width: 20,),
                        Text(list[index].split('/')[1],
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold,
                              color: Colors.green),),
                        const SizedBox(width: 25,),
                      ],
                    ),
                  );
                },);

              //return scoreRow(list);
            }
          else{
            return const CircularProgressIndicator();
          }
        },
      );
  }

  Future<List<String>> getScores() async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    List<String> list = pref.getStringList('Scores')??[];
    return list;
  }

  Widget scoreRow(List<String>list){
    List<Widget> lw = [];
    for(var i in list){
      lw.add(Container(
        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
        margin: const EdgeInsets.only(left: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(50)),
          gradient: LinearGradient(
              colors: [KRedGrad,Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: const [0.1,0.99]),
        ),
        child:  Row(
          children: [
            Text(i.split('/')[0],
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(i.split('/')[1],
              style: const TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold,
                  color: Colors.grey),),
            const SizedBox(width: 20,),
            Text(i.split('/')[2],
              style: const TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold,
                  color: Colors.red),),
            const SizedBox(width: 20,),
            Text(i.split('/')[3],
              style: const TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold,
                  color: Colors.green),),
            const SizedBox(width: 25,),
          ],
        ),
      ));
    }
    return Column(children:lw ,);
  }

}
