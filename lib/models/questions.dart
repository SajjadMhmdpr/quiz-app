
class Question{

  String question;
  String image_address;
  int score;
  Option optn1;
  Option optn2;
  StateAnswer state_answer;


  Question(this.question,this.optn1
      ,this.optn2,this.image_address,this.score):state_answer=StateAnswer(false, true,false){}

  void check_answer(int i){
    //score=1;
    if(i==1){
      state_answer.iscorrrect=optn1.answer;
      state_answer.white=false;

    }
    else if(i==2){
      state_answer.iscorrrect=optn2.answer;
      state_answer.white=false;

    }
    else{
      state_answer.iscorrrect=false;
      state_answer.white=true;

    }
    state_answer.read=true;


  }

  void reset(){
    state_answer.white=true;
    state_answer.read=false;
    state_answer.iscorrrect=false;
  }



}

class Option{
  String optionTxt;
  bool answer;

  Option(this.optionTxt,this.answer);

}

class StateAnswer{
   bool iscorrrect;
   bool white;
   bool read;
  StateAnswer(this.iscorrrect,this.white,this.read);

}

List<Question> questions=[
  Question('دریا چه رنگی است ؟', Option('سفید',false), Option('آبی',true), 'assets/images/sea.jpg', 1),
  Question('ایا زمین تخت است ؟', Option('خیر',true), Option('بله',false), 'assets/images/earth.jpg', 1),
  Question('اره برقی با چه سوختی کار میکند ؟', Option('برق',false), Option('بنزین',true), 'assets/images/arre.jpg', 1),
  Question('فوتبال را به چه عضوی از بدن بازی میکنند ؟', Option('دست',false), Option('پا',true), 'assets/images/foot.jpg', 1),
  Question('ایا خورشید داغ است ؟', Option('بله',true), Option('خیر',false), 'assets/images/sun.png', 1),
  Question('کدام رنگ در پرچم ایران نیست ؟', Option('کله غاذی',true), Option('سبز',false), 'assets/images/iran.jpg', 1),
  Question('کدام از زمین فاصله بیشتری دارد ؟', Option('ماه',false), Option('نپتون',true), 'assets/images/earth2.jpg', 1),
  Question('علم بهتر است یا ثروت ؟', Option('علم',false), Option('ثروت',true), 'assets/images/elm.jpg', 1),
  Question('علت مرگ بروسلی کدام است ؟', Option('سرطان',true), Option('قتل',false), 'assets/images/brsli.jpg', 1),
  Question('رابرت داونی جونیور چه نقشی بازی کرده است ؟', Option('بروسلی',false), Option('مرد آهنی',true), 'assets/images/iron.jpeg', 1),
];