

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:loginpage/home_screen/HomeScreen.dart';

class LoginScreen extends StatelessWidget 
{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String storedEmail = "amruthaabc@gmail.com";
    String storedPass = "12345678";
    final _emailFormKey = GlobalKey<FormState>();
    final _passwordFormKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://images.pexels.com/photos/450060/pexels-photo-450060.jpeg?auto=compress&cs=tinysrgb&w=600"))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Form(
                key: _emailFormKey,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid email:';
                    }
                    else if(value.contains("@"))
                    {
                      return null;
                    }

                    else
                    {
                      return "Invalid Email Address";
                    }

                  },

                  decoration: InputDecoration(
                    label: Text("Email"),
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(Icons.email, color: Colors.white,),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(width: 2, color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Form(
                key: _passwordFormKey,
                  child: TextFormField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid password:';
                      }
                      else if(value.length >= 8 && value != null)
                      {
                        return null;
                      }

                      else
                      {
                        return "Invalid Password";
                      }

                    },
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      label: Text("Password"),
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: Icon(Icons.key, color: Colors.white,),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                      ),
                    ),
                    // onChanged: (value){
                    //   print("onChangedValue" + value);
                    // },
                  ),),
              SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    onPressed: (){

          // Validate returns true if the form is valid, or false otherwise.
          if (_emailFormKey.currentState!.validate() && _passwordFormKey.currentState!.validate())
          {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            if (emailController.text == storedEmail && passwordController.text == storedPass)
              {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);

              }
            else
              {
               // print("Invaild credentials");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Invalid Credentials'),
                   // action: SnackBarAction(label: "Close", onPressed: () {}),
                    duration: Duration(seconds: 10),
                    padding: EdgeInsets.all(30),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10), // outersideleke gap varan
                  ),
                );
              }

          }
                },
                    child: Text("LOGIN", style: TextStyle(color: Colors.black, fontSize: 18),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
     