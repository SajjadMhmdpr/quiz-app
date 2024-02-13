import 'package:flutter/material.dart';
import '../constant.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key, required this.list});
  final List<Widget> list ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [kBlueMainPageUp, kBlueMainPageDown],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children:list,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
