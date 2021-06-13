import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rhb4u/model/data.dart';
import 'package:rhb4u/notifier/questionNotifier.dart';

import 'form2.dart';
import 'onboard.dart';

class InvestmentPage extends StatefulWidget {
  @override
  _InvestmentPageState createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {

  final _formKey = new GlobalKey<FormState>();
  var _dismissKeyboard = FocusNode();
  late QuestionNotifier modelInstance;
  late List recommendedProducts;

  String? _goals;
  // String? _interest;
  double? _amount;
  double _riskLevel = 1;
  Map _tolerance = Map<double, String>();
  String? _risk;

  final List<String> _goalsList = [
    'Children Education', 'Foreign', 'General'
  ];
  // final List<String> _interestList = [
  //   'asdasd','asfewqd', '2edwqd', '0sfiuqfh'
  // ];

  void crossCheckModel() {

  }

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
    _tolerance = {
      1 : 'Low',
      2 : 'Moderate',
      3 : 'High',
    };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Consumer<QuestionNotifier>(
        builder: (context, notifier, snapshot) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_dismissKeyboard),
            child: Container(
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
      
                      Stack(  //image
                        children: [
                          Image.asset(
                            'assets/images/InvestProsesBanner-1.png',
                            // width: 300,
                            // height: 180,
                            fit: BoxFit.none,
                            filterQuality: FilterQuality.high,
                          ),
                        ],
                      ),
                
                      SizedBox(height: 20,),
                
                      Center( //page number
                        child: Image.asset(  
                          'assets/images/Process (1).png',
                          width: 300,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                
                      SizedBox(height: 20,),
                
                      Padding(  //investment wording
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Text(
                          'Investment',
                          style: GoogleFonts.amiko(color: Colors.blue.shade900, fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                
                      SizedBox(height: 20,),
                
                      Padding(  //investment goals
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 2, color: Colors.blue.shade900)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 2),
                                child: DropdownButtonFormField<String>(
                                  //style: _textInputStyle,
                                  decoration: InputDecoration(
                                    fillColor: Colors.blue.shade900,
                                    focusColor: Colors.blue.shade900,
                                    hoverColor: Colors.blue.shade900,
                                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                  ),
                                  iconSize: 26,
                                  iconEnabledColor: Colors.blue.shade900,
                                  isExpanded: true,
                                  elevation: 8,
                                  value: _goals,
                                  items: _goalsList.map((value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) => setState(() => _goals = value),
                                  // validator: (value){
                                  //   if (value!.isEmpty){
                                  //     return 'Field required';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              )
                            ),
                
                             Positioned(
                                top: -3.8,
                                left: 10,
                                child: Container(
                                  width: 150,
                                  color: Colors.white,
                                  child: Text(
                                    'Investment Goals', 
                                    style: TextStyle(
                                      color: Colors.blue.shade900, fontSize: 15, fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                
                          ],
                        ),
                      ),
                
                      SizedBox(height: 20,),
                
                      // Padding(  //interest
                      //   padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      //   child: Stack(
                      //     children: [
                      //       Container(
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(15),
                      //           border: Border.all(width: 2, color: Colors.blue.shade900)
                      //         ),
                      //         child: Padding(
                      //           padding: EdgeInsets.only(left: 10, right: 2),
                      //           child: DropdownButtonFormField<String>(
                      //             //style: _textInputStyle,
                      //             decoration: InputDecoration(
                      //               fillColor: Colors.blue.shade900,
                      //               focusColor: Colors.blue.shade900,
                      //               hoverColor: Colors.blue.shade900,
                      //               errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      //             ),
                      //             iconSize: 26,
                      //             iconEnabledColor: Colors.blue.shade900,
                      //             isExpanded: true,
                      //             elevation: 8,
                      //             value: _interest,
                      //             items: _interestList.map((value) {
                      //               return DropdownMenuItem(
                      //                 value: value,
                      //                 child: Text(value),
                      //               );
                      //             }).toList(),
                      //             onChanged: (value) => setState(() => _interest = value),
                      //           ),
                      //         )
                      //       ),
                      //        Positioned(
                      //           top: -3.8,
                      //           left: 10,
                      //           child: Container(
                      //             width: 80,
                      //             color: Colors.white,
                      //             child: Text(
                      //               'Interest', 
                      //               style: TextStyle(
                      //                 color: Colors.blue.shade900, fontSize: 15, fontWeight: FontWeight.bold
                      //               ),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ),
                      //         )
                      //     ],
                      //   ),
                      // ),
                
                      SizedBox(height: 20,),
                
                      Padding(  //Contribution
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                        child: Container(
                          height: 60,
                          child: TextFormField(
                            //style: _textInputStyle,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              focusedBorder: _borderDecoration,
                              enabledBorder: _borderDecoration,
                              labelText: 'Monthly Contribution (RM)',
                              labelStyle: _labelTextStyle,
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              prefixText: 'RM '
                            ),
                            maxLines: 1,
                            // validator: (value) => _amount!.isNaN || _amount! < 0 ? 'Amount must be a valid number' : null,
                            onSaved: (value) {
                              setState(() => _amount = double.parse(value!));
                            },
                            onChanged: (value) {
                              setState(() => _amount = double.parse(value));
                            },
                          ),
                        ),
                      ),
                
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                
                            RichText(
                              text: TextSpan(
                                text: 'Risk Tolerance: ',
                                style: TextStyle(fontSize: 16, color: Colors.blue.shade900, fontWeight: FontWeight.normal),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: _riskLevel == 1 ? 'Low' : _riskLevel == 2 ? 'Moderate' : 'High',
                                    // style: TextStyle(fontWeight: FontWeight.normal)),
                                    style: _riskLevel == 1 ? 
                                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade700) 
                                    : _riskLevel == 2 ? 
                                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade500) 
                                    : TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade700) 
                                  )
                                ]
                              ),
                            ),
                
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.lightBlue,
                                inactiveTrackColor: Colors.lightBlue,
                                trackShape: RectangularSliderTrackShape(),
                                trackHeight: 5.0,
                                thumbColor: Colors.blue.shade900,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
                                overlayColor: Colors.blue.withAlpha(32),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                                valueIndicatorTextStyle: TextStyle()
                              ),
                              child: Slider(
                                value: _riskLevel,
                                min: 1,
                                max: 3,
                                divisions: 2,
                                // activeColor: Colors.green,
                                label: _riskLevel == 1 ? 'Low' : _riskLevel == 2 ? 'Moderate' : 'High',
                                onChanged: (value) {
                                  setState( () {
                                  _riskLevel = value;
                                  },);
                                },
                              ),
                            ), 
                          
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Low',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade700)
                                ),
                                Text('Moderate',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade700)
                                ),
                                Text('High',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade700)
                                ),
                              ],
                            )
                
                          ],
                        )
                      ),
                
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),

      bottomNavigationBar: Consumer<QuestionNotifier>(
        builder: (context, notifier, snapshot) {
          return Padding(  //cancel and NEXT
            padding: EdgeInsets.only(bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  RaisedButton( //previous
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.blue.shade900, width: 2)
                    ),
                    onPressed: () {
                      // Navigator.pop(context);
                      QuestionNotifier modelInstance = Provider.of<QuestionNotifier>(context, listen: false);
                      modelInstance.setDataModel = DataModel();
                      confirmationAlertDialog();
                    } ,
                    child: Container(
                      width: 100,
                      height: 30,
                      child: Center(
                        child: Text('Exit', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 17),),
                      ),
                    ),
                  ),
                  
                  SizedBox(width: 15,),
                  
                  RaisedButton( //next
                    color: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.blue.shade900, width: 2)
                    ),
                    onPressed: () {
                      runClasificationAlgorithm(notifier);
                      // if(_formKey.currentState!.validate()){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PersonalisedProductPage(product: recommendedProducts,)),
                        );
                      // }
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Next', 
                          style: TextStyle(
                            color: Colors.white, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 17
                          ),
                        ),
                      ),
                    ),
                  )
                ]
                ,
              ),
            ),
          );
        }
      ),


    );
  }

  
  confirmationAlertDialog() {

    AlertDialog alert = AlertDialog(

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Cancel Investment',
              style: GoogleFonts.amiko(color: Colors.blue.shade900, fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.0,),

            Text(
              'Are you sure you want to cancel the investment',
              style: GoogleFonts.amiko(color: Colors.grey.shade900, fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 10.0,),

            Row(  //buttons
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [

                Expanded( 
                  child: RaisedButton( 
                    onPressed: () async {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.blue.shade900, width: 2)
                    ),
                    disabledColor: Colors.grey[400],
                    disabledTextColor: Colors.white,
                    disabledElevation: 0,
                    color: Colors.white,
                    elevation: 0,
                    child: Container(
                      height: 15,
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 12.0,
                            fontWeight: FontWeight.w700
                          )
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 5.0,),

                Expanded( 
                  child: RaisedButton( 
                    onPressed: () async {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.blue.shade900, width: 2)
                    ),
                    disabledColor: Colors.grey[400],
                    disabledTextColor: Colors.white,
                    disabledElevation: 0,
                    color: Colors.blue.shade900,
                    elevation: 0,
                    child: Container(
                      height: 15,
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ],
        ),
      )
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  void runClassificationAlgorithm(QuestionNotifier notifier){
    
    if(_amount! >= 1500 && _goals == 'Children Education'){
      recommendedProducts = notifier.getDataModel.childrenEdu;
    } else if(_amount! >= 1500 && _goals == 'Foreign'){
      recommendedProducts = notifier.getDataModel.foreign;
    } else if(_amount! >= 1500 && _goals == 'General'){
      recommendedProducts = notifier.getDataModel.general;
    } else {
      recommendedProducts = notifier.getDataModel.general;
    }

    crossCheckModel();

    setState(() {});

  }

  void runClasificationAlgorithm(QuestionNotifier notifier){
    
    if(_amount! >= 1500 && _goals == 'Children Education'){
      recommendedProducts = DataModel().childrenEdu;
    } else if(_amount! >= 1500 && _goals == 'Foreign'){
      recommendedProducts = DataModel().foreign;
    } else if(_amount! >= 1500 && _goals == 'General'){
      recommendedProducts = DataModel().general;
    } else {
      recommendedProducts = DataModel().general;
    }

    crossCheckModel();

    setState(() {});

  }

}