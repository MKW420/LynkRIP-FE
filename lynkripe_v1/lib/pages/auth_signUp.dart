import 'package:flutter/material.dart';
import '../services/firebase/firebase_auth.dart';
import '/components/button.dart';
import '/constants.dart';

class auth extends StatelessWidget {
  const auth({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
        body:Column(
          
          children: [
            SizedBox(height:80),
            Text("Lynk", style:h1, ),
            SizedBox(height:10),
            Text("Welcome back to Lynk!", style:h2.copyWith(fontSize: 15, color:black) ),
            SizedBox(height:120),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:22),
              child:  TextField(
                decoration: InputDecoration(
                  fillColor: lightBlue, 
                  filled:true, 
                  hintText:"Email",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), 
                    borderSide: BorderSide.none)),
              ),           
            ),
             Padding(
              padding:EdgeInsets.symmetric(horizontal:22, vertical: 23),
              child:  TextField(
              
                decoration: InputDecoration(fillColor: lightBlue, filled:true, hintText:"Password",
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),

                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Align(alignment: Alignment.centerLeft ,child:Text("Forgot your password?",
                style: body.copyWith(
                  fontSize:15,
                  color:black,
                  fontWeight: FontWeight.w500
                ))),
              ),
              SizedBox(height:50, width: 160),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child:Custombutton()
              ),
              SizedBox(height:50),
              Text("Not a member? Register now", style: body.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black )),
              SizedBox(height: 60),
              Text("Or continue with", style: body.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color:black
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
