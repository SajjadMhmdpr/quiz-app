import 'package:flutter/material.dart';
import 'package:quiz_app_1/constant.dart';
import 'package:quiz_app_1/pages/result.dart';
import 'package:quiz_app_1/widgets/answer_option_btn.dart';
import 'package:quiz_app_1/widgets/base_widget.dart';
import 'package:quiz_app_1/widgets/question_number_list.dart';
import 'models/questions.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(Phoenix(
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Size size;

  int current_question = 0;

  bool isOnePress = false;
  bool isTwoPress = false;

  late AnimationController controller;
  late Animation animation;
  ScrollController scrollController = ScrollController();

  int correct = 0;
  int wrong = 0;
  int white = 0;
  List<int> resList = [];

  //int t2=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        // int t=double.parse((animation.value*100).toString()).round();
        // if( t2!=t&&t>98){
        //   nextQuestion();
        //
        // }
        // t2=t;
        // print(t);

        if ((animation.value * 100).round() > 98) {
          nextQuestion();

          if (controller.isAnimating) {
            controller.reset();
            controller.forward();
          }
        }

        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(list: [
      const SizedBox(
        height: 45,
      ),
      Container(
        height: 20,
        decoration: BoxDecoration(
          color: KBluePrograssBtn,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: LinearProgressIndicator(
            value: animation.value,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      QuestionNumberList(
          current_question: current_question,
          scrollController: scrollController),
      const SizedBox(height: 20),
      SizedBox(
        height: 410,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width - 190,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                width: size.width - 130,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Positioned(
                top: 80,
                bottom: 50,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    width: size.width - 41,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        colors: [Colors.white, kGradientQuizBac],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [0.6, 3],
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 70,
                            color: Colors.black.withOpacity(0.3)),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 85,
                        ),
                        Text(
                          questions[current_question].question,
                          style: TextStyle(
                              color: KText,
                              fontSize: 35,
                              fontFamily: 'RoyaB',
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AnswerOptionBtn(
                                answerTxt:
                                    questions[current_question].optn1.optionTxt,
                                option: 1,
                                isOnePress: isOnePress,
                                isTwoPress: isTwoPress,
                                onTapped: () {
                                  onAnswerBtnTap(1);
                                }),
                            AnswerOptionBtn(
                                answerTxt:
                                    questions[current_question].optn2.optionTxt,
                                option: 2,
                                isOnePress: isOnePress,
                                isTwoPress: isTwoPress,
                                onTapped: () {
                                  onAnswerBtnTap(2);
                                }),
                          ],
                        )
                      ],
                    ))),
            Positioned(
              top: 0,
              child: Image.asset(
                questions[current_question].image_address,
                height: 170,
              ),
            ),
          ],
        ),
      ),
      const Spacer(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: KBlueBottonNext,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25)),
            child: InkWell(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              onTap: () {
                nextQuestion();
              },
              child: Container(
                width: 250,
                padding: const EdgeInsets.symmetric(vertical: 10),
                //width: 100,
                decoration: const BoxDecoration(
                    //color: KBlueBottonNext,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: const Center(
                    child: Text('Next',
                        style: TextStyle(color: Colors.white, fontSize: 40))),
              ),
            ),
          ),
          Material(
            color: KIconFlag,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            child: InkWell(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              onTap: () {
                if (controller.isAnimating) {
                  controller.reset();
                  controller.dispose();
                }
                calculateRes();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(resultList: resList),
                    ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: 80,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                child: const Icon(Icons.flag, size: 50, color: Colors.white),
              ),
            ),
          ),
        ],
      )
    ]);
  }

  void onAnswerBtnTap(int option) {
    if (option == 1) {
      isOnePress = true;
      isTwoPress = false;
    } else {
      isTwoPress = true;
      isOnePress = false;
    }
    setState(() {});
  }

  void nextQuestion() {
    if (controller.isAnimating) {
      controller.reset();
      controller.forward();
    }

    scrollController.animateTo(current_question * 70,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    if (isOnePress && !isTwoPress) {
      questions[current_question].check_answer(1);
    } else if (!isOnePress && isTwoPress) {
      questions[current_question].check_answer(2);
    } else {
      questions[current_question].check_answer(0);
    }

    if (current_question < questions.length - 1) {
      current_question++;
      setState(() {});
    } else {
      current_question++;
    }

    if (current_question == questions.length) {
      if (controller.isAnimating) {
        controller.reset();
        controller.dispose();
      }
      current_question--;
      calculateRes();
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => ResultPage( resultList:resList),));
    }

    isOnePress = false;
    isTwoPress = false;
  }

  void calculateRes() {
    for (var i in questions) {
      if (i.state_answer.iscorrrect) {
        correct++;
      } else if (i.state_answer.white) {
        white++;
      } else if (!i.state_answer.iscorrrect) {
        wrong++;
      }
    }
    resList.addAll([correct, wrong, white]);
    // resList.add(correct);
    // resList.add(wrong);
    // resList.add(white);

    //print(resList);
  }
}
