import 'package:flutter/material.dart';


class BondApp extends StatefulWidget {


  @override
  State<BondApp> createState() => _BondAppState();
}

class _BondAppState extends State<BondApp> {
  final principal=TextEditingController();
  final time=TextEditingController();
  double maturedinterest =0;
  double seminterest= 0;
  double maturedprincipal= 0;

  @override
  void initState() {
    super.initState();

    principal.addListener(() {
      if(principal.text.isEmpty){
        setState(() {
          maturedinterest = 0;
          seminterest = 0;
          maturedprincipal= 0;
        });
      }
    });

    time.addListener(() {
      if(principal.text.isEmpty){
        setState(() {
          maturedinterest = 0;
          seminterest = 0;
          maturedprincipal= 0;
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(12.0,8,9,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/kijani.jpeg'),
                SizedBox(height: 40,),
                Text('Enter Principal amount',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                TextField(
                  controller: principal,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter numbers only',
                    labelStyle: TextStyle(
                      color: Colors.lightGreen,
                    ),),

                ),
                SizedBox(height: 10,),
                Text('Time invested in years?',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                TextField(
                  controller: time,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter numbers only',
                    labelStyle: TextStyle(
                      color: Colors.lightGreen,
                    ),),
                ),
                SizedBox(height: 20,),
                ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                    onPressed: (){
                      String priamount= principal.text;
                      String years= time.text;


                      double inputno= double.parse(priamount);
                      double muda= double.parse(years);

                      setState(() {
                        maturedinterest=(inputno*10.25*muda)/100;
                        seminterest=maturedinterest/(2*muda);
                        maturedprincipal= inputno+maturedinterest;
                      });

                    },
                    child: Text('Calculate')),
                SizedBox(height: 20,),
                Text('Matured Interest: $maturedinterest',
                    style:TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
                SizedBox(height: 20,),
                Text('Interest Per Semester: $seminterest',
                    style:TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
                SizedBox(height: 20,),
                Text('Amount after maturity: $maturedprincipal',
                    style:TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ],
            ),
          ),
        ),
      ),


    );
  }
}

