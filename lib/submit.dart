import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhb4u/onboard.dart';

class SubmittedPage extends StatefulWidget {
  @override
  _SubmittedPageState createState() => _SubmittedPageState();
}

class _SubmittedPageState extends State<SubmittedPage> {

  var _dismissKeyboard = FocusNode();

  bool check = false;


  final _borderDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Colors.blue.shade900,
      width: 2 
    )
  );
  final InputDecoration _textFormInputDecoration = InputDecoration(
    hintStyle: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w300, color: Colors.black),
    border: InputBorder.none,
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue.shade900),
      borderRadius: BorderRadius.circular(1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue.shade900),
      borderRadius: BorderRadius.circular(1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue.shade900),
      borderRadius: BorderRadius.circular(1.0),
    ),
  );
  final TextStyle _subHeadingTextStyle = TextStyle(fontSize: 18, color: Colors.blue.shade900, fontWeight: FontWeight.w700);
  final _labelTextStyle = TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 20);

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_dismissKeyboard),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(height: 20, color: Colors.cyan[200],),

                Stack(  //image
                  children: [
                    Image.asset(
                      'assets/images/InvestProsesBanner-3.png',
                      // width: 300,
                      // height: 180,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
          
                SizedBox(height: 20,),
          
                Center( //page number
                  child: Image.asset(  
                    'assets/images/InvestProsesLast-Congrats.png',
                    // width: 300,
                    // height: 30,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 20,),
          
              ],
            ),
          ),
        ),
      ),


      bottomNavigationBar: Padding(  //cancel and NEXT
        padding: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.blue.shade900, width: 2)
              ),
              onPressed: () {
                // Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
              } ,
              child: Container(
                height: 30,
                child: Center(
                  child: Text('Back to HomePage', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 17),),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  

}