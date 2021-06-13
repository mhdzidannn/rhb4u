import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:rhb4u/form1.dart';
import 'package:rhb4u/notifier/questionNotifier.dart';
import 'package:rhb4u/widgets/answerOptions.dart';
import 'package:rhb4u/widgets/color.dart';


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}


class _OnBoardingPageState extends State<OnBoardingPage> {
  
  final introKey = GlobalKey<IntroductionScreenState>();

  late QuestionNotifier _questionNotifier;
  late int selectedAnswer;

  @override
  void initState() {
    super.initState();
    _questionNotifier = Provider.of<QuestionNotifier>(context, listen: false);
  }

  void _onIntroEnd(context) {
    print('asdasd');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => InvestmentPage()),
    );
  }

  Widget _buildImage(String assetName, double width, double height, Alignment align) {
    return Align(
      child: Image.asset('assets/images/$assetName.png', width: width, height: height, fit: BoxFit.fill,),
      alignment: align,
    );
  }


  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width/2;
    final double height = MediaQuery.of(context).size.height/2;

    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.blue),
      bodyTextStyle: TextStyle(fontSize: 12.0),
      imageFlex: 10,
      titlePadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      // footerPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      // descriptionPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      // imagePadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      pageColor: Colors.white,
    );


    return IntroductionScreen(
      key: introKey,
      controlsPadding: EdgeInsets.all(24),
      pages: [

        PageViewModel(
          
          image: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/EducateImage-1.png',
              width: 350,
              height: 1200,
              fit: BoxFit.fill,
            ),
          ),
          
          titleWidget: SizedBox(height: 100,),
          bodyWidget: Container(height: 100,),
          
          decoration: pageDecoration,

          reverse: true
        
        ),

        PageViewModel(
          
          image: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/EducateImage-2.png',
              width: 350,
              height: 1200,
              fit: BoxFit.fill,
            ),
          ),
          
          titleWidget: SizedBox(height: 100,),
          bodyWidget: Container(height: 100,),
          
          decoration: pageDecoration,

          reverse: true
        
        ),

        PageViewModel(
          
          image: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/EducateImage-3.png',
              width: 350,
              height: 1200,
              fit: BoxFit.fill,
            ),
          ),
          
          titleWidget: SizedBox(height: 100,),
          bodyWidget: Container(height: 100,),
          
          decoration: pageDecoration,

          reverse: true
        
        ),

        PageViewModel(
          
          image: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/EducateImage-4.png',
              width: 350,
              height: 1200,
              fit: BoxFit.fill,
            ),
          ),
          
          titleWidget: SizedBox(height: 100,),
          bodyWidget: Container(height: 100,),
          
          decoration: pageDecoration,

          reverse: true
        
        ),

        PageViewModel(  //QUIZ
          
          titleWidget: Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image.asset(
              'assets/images/Quiz.png',
              width: 300,
              height: 180,
              fit: BoxFit.fill,
            ),
          ),


          bodyWidget: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        'Select your answer below',
                        style: GoogleFonts.amiko(
                          color: Colors.blue[700], 
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                      SizedBox(height: 20,),

                      Option(
                        index: 0,
                        text: 'Charity',
                        press: () {
                          _questionNotifier.checkAns(0);
                          setState(() {});
                        },
                      ),

                      Option(
                        index: 1,
                        text: 'Make money',
                        press: () {
                          _questionNotifier.checkAns(1);
                          setState(() {});
                        },
                      ),

                      Option(
                        index: 2,
                        text: 'Gambling',
                        press: () {
                          _questionNotifier.checkAns(2);
                          setState(() {});
                        },
                      ),

                      Option(
                        index: 3,
                        text: 'Losses',
                        press: () {
                          _questionNotifier.checkAns(3);
                          setState(() {});
                        },
                      ),



                    ],
                  ),
          
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                      child: Image.asset(
                        'assets/images/14.png',
                        width: 180,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
          
                ],
              ),

              SizedBox(height: 20,),
              
              _questionNotifier.isAnswered ?
              _questionNotifier.selectedAns == 1 ?
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green[800],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.done, color: Colors.green[700], size: 16),
                    ),
                    Text(
                      "You got it right",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              )
              
              : Container(
                width: 200,
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red[700],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.done, color: Colors.red[700], size: 16),
                    ),
                    Text(
                      "Opps! Nice try!",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              )
              
              
              : Container()
            ],
          ),
          
          decoration: pageDecoration,

          reverse: true
        
        ),

        PageViewModel(
          
          image: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/EducateImage-6.png',
              width: 350,
              height: 1200,
              fit: BoxFit.fill,
            ),
          ),
          
          titleWidget: SizedBox(height: 100,),
          bodyWidget: Container(height: 100,),
          
          decoration: pageDecoration,

          reverse: true
        
        ),


      ],

      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,

      skipFlex: 0,
      nextFlex: 0,

      skip: Text('Skip'),
      next: Icon(Icons.arrow_forward),
      done: Container(
        //color: colorBlue,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: colorBlue,
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Text('Done', style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w700))
      ),

      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );

  }
}