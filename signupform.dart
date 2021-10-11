import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {


  GlobalKey<FormState> _key = new GlobalKey<FormState>();

  var firebase = FirebaseFirestore.instance;

  // TextFormField Controller
  var name = new TextEditingController();
  var email = new TextEditingController();
  var pass = new TextEditingController();
  var dob = new TextEditingController();
  var mobnumber = new TextEditingController();
  var weight = new TextEditingController();
  var height = new TextEditingController();


  //date  picker
  late DateTime _dateTime;

  //custom date formatter
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  // These Function will register users data in the firebase firestore.
  void createuser() async{
    try{
      await firebase.collection('Fitness')
          .doc(mobnumber.text.toString())
          .set({
        "name": name.text.toString(),
        "email": email.text.toString(),
        "pass": pass.text.toString(),
        "dob": dob.text.toString(),
        "mobnumber": mobnumber.text.toString(),
        "weight": weight.text.toString(),
        "height": height.text.toString()
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data Added Successfully")));
    }catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fail to add data")));
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(24, 25, 113,10),
        title: Text(
          "SignUp form",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(24, 25, 113,10),
          ),
          padding: EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Image.asset('assets/running.png'),
              ),

              Form(
                key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     TextFormField(

                       // Name textformfield


                       controller: name,
                       keyboardType: TextInputType.name,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.white,),
                         hintText: "Enter Name",
                         labelText: "Name",
                         labelStyle: TextStyle(
                           color: Colors.white,
                         ),
                         hintStyle: TextStyle(
                           color: Colors.white,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.5,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                         )
                       ),
                     ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(

                       // Email textformfield

                       controller: email,
                       keyboardType: TextInputType.emailAddress,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.email,color: Colors.white,),
                         hintText: "Enter Email",
                         labelText: "Email",
                         labelStyle: TextStyle(
                           color: Colors.white,
                         ),
                         hintStyle: TextStyle(
                           color: Colors.white,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.5,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                             )
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(

                       //Password TextFormField


                       controller: pass,
                       keyboardType: TextInputType.visiblePassword,
                       obscureText: true,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.password,color: Colors.white,),
                         hintText: "Enter Password",
                         labelText: "Password",
                         labelStyle: TextStyle(
                           color: Colors.white,
                         ),
                         hintStyle: TextStyle(
                           color: Colors.white,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.5,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                             )
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(

                       // Date Picker TextFormField


                       onTap: (){
                         showDatePicker(context: context,
                             initialDate: DateTime.now(),
                             firstDate: DateTime(1900),
                             lastDate: DateTime(3000)).then((date) {
                               setState(() {
                                 _dateTime = date!;
                                 dob.text = formatter.format(_dateTime);
                               });
                         });
                       },
                       controller: dob,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                       keyboardType: TextInputType.datetime,
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.date_range,color: Colors.white,),
                         hintText: "Enter date of birth",
                         labelText: "DOB",
                         labelStyle: TextStyle(
                           color: Colors.white,
                         ),
                         hintStyle: TextStyle(
                           color: Colors.white,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.5,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                             )
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(


                       // Mobile Number TextFormField


                       controller: mobnumber,
                       keyboardType: TextInputType.number,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.phone,color: Colors.white,),
                         hintText: "Enter Phone Number",
                         labelText: "Phone Number",
                         labelStyle: TextStyle(
                           color: Colors.white,
                         ),
                         hintStyle: TextStyle(
                           color: Colors.white,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.5,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                             )
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(


                       //Weight TextForm Field


                       controller: weight,
                       keyboardType: TextInputType.number,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.line_weight,color: Colors.white,),
                         hintText: "Enter Weight",
                         labelText: "Weight",
                         labelStyle: TextStyle(
                           color: Colors.white,
                         ),
                         hintStyle: TextStyle(
                           color: Colors.white,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.5,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                             )
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(

                       //Height TextFormField


                       controller: height,
                       keyboardType: TextInputType.number,
                       style: TextStyle(
                         color: Colors.white,
                       ),
                       decoration: InputDecoration(
                         prefixIcon: Icon(Icons.height,color: Colors.white,),
                         hintText: "Enter Height",
                         labelText: "Height",
                         labelStyle: TextStyle(
                           color: Colors.white,
                         ),
                         hintStyle: TextStyle(
                           color: Colors.white,
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.5,
                           ),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                             )
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 50,
                     ),
                     ElevatedButton(

                       onPressed: (){
                         createuser();
                         name.clear();
                         email.clear();
                         dob.clear();
                         pass.clear();
                         mobnumber.clear();
                         weight.clear();
                         height.clear();


                       },
                       style: TextButton.styleFrom(
                         backgroundColor: Color.fromARGB(0,0,0,0),
                         shadowColor: Color.fromARGB(0,0,0,0),
                       ),
                       child: Container(
                         decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Colors.red,
                              Colors.blue
                            ],
                          ),
                         ),

                         width: MediaQuery.of(context).size.width,
                         height: MediaQuery.of(context).size.height/15,
                        child: Center(
                          child: Text("Sign up"),
                         ),
                       ),
                     )



                   ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
