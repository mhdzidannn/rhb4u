import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhb4u/submit.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalisedProductPage extends StatefulWidget {

  @override
  List product;

  PersonalisedProductPage({Key? key, required this.product}) : super(key: key);

  _PersonalisedProductPageState createState() => _PersonalisedProductPageState();
}

class _PersonalisedProductPageState extends State<PersonalisedProductPage> {

  var _dismissKeyboard = FocusNode();
  List hasAtLeastOneSelected = [];

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
                      'assets/images/InvestProsesBanner-2.png',
                      // width: 300,
                      // height: 180,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
          
                SizedBox(height: 20,),
          
                Center( //page number
                  child: Image.asset(  
                    'assets/images/Process (2).png',
                    width: 300,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                ),
          
                SizedBox(height: 20,),
          
                Padding(  //finance wording
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: Text(
                    'Personalised Finance',
                    style: GoogleFonts.amiko(color: Colors.blue.shade900, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
          
                Padding(  //investment wording
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: Text(
                    'Here are the list of investment made specially for you',
                    style: GoogleFonts.amiko(color: Colors.black, fontSize: 15),
                  ),
                ),
          
                ListView.builder(
                  itemBuilder: (context, index){
                    return productCard(widget.product[index]);
                  },
                  itemCount: widget.product.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
                
              ],
            ),
          ),
        ),
      ),


      bottomNavigationBar: Padding(  
        padding: EdgeInsets.only(bottom: 30),
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                  Navigator.pop(context);
                } ,
                child: Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text('Previous', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 17),),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              RaisedButton(
                color: Colors.blue.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.blue.shade900, width: 2)
                ),
                onPressed: !hasAtLeastOneSelected.isEmpty ? () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SubmittedPage()),
                  );
                } : null,
                // onPressed: null,
                child: Container(
                  width: 100,
                  height: 30,
                  child: Center(
                    child: Text(
                      'Submit', 
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold, 
                        fontSize: 17
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }


  Widget productCard(dynamic data){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Colors.blue.shade500),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 2,
              offset: Offset(1, 1), // Shadow position
            ),
          ]
        ),
        child: Center(
          child: CheckboxListTile(
            value: data['selected'], 
            onChanged: (bool? value) { 
              setState(() {
                data['selected'] = !data['selected'];
                if(value == true){
                  hasAtLeastOneSelected.add(data['name']);
                }
                if (value == false){
                  hasAtLeastOneSelected.remove(data['name']);
                }
                
              });
            },
            title: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                data['name']
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['details'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  InkWell(
                    onTap: () async {
                      final url = data['url'];
                      if (await canLaunch(url)) {
                        launch(url);
                      }
                    },
                    child: Text(
                      'Read more ...',
                      style: GoogleFonts.amiko(color: Colors.blue.shade900, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue.shade900,
          ),
        ),
      ),
    );
  }

  

}