import 'package:flutter/material.dart';
import 'package:markgroup/models/Loginmodel.dart';
import 'package:markgroup/view/HomePage.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();

}
class _loginpageState extends State<loginpage> {
  final Key = GlobalKey<FormState>();
  TextEditingController mobilecontroller=new TextEditingController();
  TextEditingController passcontroller=new TextEditingController();




  void login(BuildContext context) async{

    var client = http.Client();

    String mobile=mobilecontroller.text;
    String pass=passcontroller.text;

    var jsonresponse= await client.post("http://markbuilders.in/admin/public/api/login?phone=9037735350&password=123456789",

        headers: {

          "Accept": "application/json",
        },

        body: {
          "mobile":mobile,
          "password":pass,
        }

    );

    if(jsonresponse.statusCode==200)
    {
      var response = await LoginClass.fromJson(jsonDecode(jsonresponse.body,));

      if(response.status=="1")
      {
        print('login success');
          //String aaa=response.data.userProfile;
        List <UserProfile> name=response.data.userProfile.toList();
        print(name);
       String token=response.data.token; ///passing name into home page
        SharedPreferences prefs = await  SharedPreferences.getInstance();
        prefs.setString('token',token);
       print(prefs.getString('token'));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
      }
      else
        {
        print("login failed");
      }
    }
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: Key,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
              child: Container(
                width: 380,height: 260,
                child: Image.asset("images/loginlogo.png",height: 260,width: 380,),
              ),
            ),


            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                child:

                    TextFormField(
                      controller: mobilecontroller,
                     validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Mobile Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        labelText: "Mobile Number",
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),

              ),
            ),

            SizedBox(
              height: 25,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                child:

                    TextFormField(
                      obscureText: true,
                      controller: passcontroller,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),

              ),
            ),


            SizedBox(
              height: 34,
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 40,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    textColor: Colors.white,
                    color: Colors.indigo.shade500,
                    child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 15),
                        )),
                    onPressed: () {


                      if (Key.currentState.validate()) {

                        login(context);

                      }


                     /* Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));*/



                    }
                    ),
              ),
            ),


            SizedBox(
              height: 18,
            ),


            Center(
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}

