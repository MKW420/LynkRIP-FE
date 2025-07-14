import 'package:flutter/material.dart';
import '../services/firebase/auth/firebase_auth_google.dart';
import '/components/button.dart';
import '/constants.dart';

class auth extends StatelessWidget {
  const auth({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
        body:Column(
          
          children: [
            SizedBox(height:5),
            Image.asset('assets/logo.png', height: 270,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:20, vertical: 10),
              child:  TextField(
                decoration: InputDecoration(
                  fillColor: lightPrimary, 
                  filled:true, 
                  hintText:"Enter your email",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), 
                    borderSide: BorderSide.none)),
              ),     
                    
            ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                child: Align(alignment: Alignment.centerLeft ,child:Text("* Incorrect email entered",
                style: body.copyWith(
                  fontSize:12,
                  color:red,
                  fontWeight: FontWeight.w500
                ))),
              ),             
              Padding(
              padding:EdgeInsets.symmetric(horizontal:20, vertical: 10),
              child:  TextField(
              
                decoration: InputDecoration(fillColor: lightPrimary, filled:true, hintText:"Enter your password",
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),

                ),
                ),
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical:2),
                child: Align(alignment: Alignment.centerLeft ,child:Text("* Incorrect password entered",
                style: body.copyWith(
                  fontSize:12,
                  color:red,
                  fontWeight: FontWeight.w500
                ))),
              ),  
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                child: Align(alignment: Alignment.centerLeft ,child:Text("Forgot your password?",
                style: body.copyWith(
                  fontSize:15,
                  color:darkPrimary,
                  fontWeight: FontWeight.w500
                ))),
              ),
              SizedBox(height:15, width: 160),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child:Custombutton(buttonText: 'Sign in',)
              ),
              SizedBox(height:50),
              Text("Not a member? Register now", style: body.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: darkPrimary )),
              SizedBox(height: 30),
              Text("Or continue with", style: body.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:darkPrimary
              ),
                ),
              SizedBox(height:50),
            
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      FirebaseServices().signInWithGoogle();
                    },
                    child:Container(
                       height:44,
                       width:60,
                       decoration: BoxDecoration(
                       color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Image.asset("assets/google.png")
                ) ,
                  ),
                
              ],)     
          ])
      );
      
  }
 
  
}
