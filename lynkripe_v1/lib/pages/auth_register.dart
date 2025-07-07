import 'package:flutter/material.dart';
import '../services/firebase/firebase_auth.dart';
import '/components/button.dart';
import '/constants.dart';

class authRegister extends StatelessWidget {
  const authRegister({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
        body:Column(
          children: [
            SizedBox(height:80),
            Padding(padding:EdgeInsets.symmetric(horizontal:22),
               child:Align(alignment:Alignment.centerLeft, 
               child:Text ("Sign up to Lynk", style: h2.copyWith(fontSize: 20)), ),),
            
            SizedBox(height:10),
               Padding(padding:EdgeInsets.symmetric(horizontal:22),
               child:Align(alignment:Alignment.centerLeft, 
               child:Text ("Create an account to get started", style: h2.copyWith(fontSize: 15, color:Colors.grey, fontWeight: FontWeight.normal )), ),),
            SizedBox(height:30),
             Padding(padding:EdgeInsets.symmetric(horizontal:24, vertical:12),
               child:Align(alignment:Alignment.centerLeft, 
               child:Text ("Name", style: h2.copyWith(fontSize: 16)), ),),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:24),
              child:  TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100, 
                  filled:true, 
                  hintText:"Name",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), 
                    borderSide: BorderSide.none)),
              ),           
            ),
              Padding(padding:EdgeInsets.symmetric(horizontal:24, vertical: 12),
               child:Align(alignment:Alignment.centerLeft, 
               child:Text ("Email", style: h2.copyWith(fontSize: 16)), ),),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:22),
              child:  TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100, 
                  filled:true, 
                  hintText:"Email",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), 
                    borderSide: BorderSide.none)),
              ),           
            ),
            SizedBox(height:30),
             Padding(padding:EdgeInsets.symmetric(horizontal:24),
               child:Align(alignment:Alignment.centerLeft, 
               child:Text ("Password", style: h2.copyWith(fontSize: 16)), ),),
             Padding(
              padding:EdgeInsets.symmetric(horizontal:22, vertical: 15),
              child:  TextField(
              
                decoration: InputDecoration(fillColor: Colors.grey.shade100, filled:true, hintText:"Password",
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),

                ),
                ),
              ),
              Padding(
              padding:EdgeInsets.symmetric(horizontal:22),
              child:  TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100, 
                  filled:true, 
                  hintText:"Confirm Password",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), 
                    borderSide: BorderSide.none)),
              ),           
            ),
                        
             SizedBox(height:20, ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Align(alignment: Alignment.centerLeft ,child:Text("Already a member? Sign in",
                style: body.copyWith(
                  fontSize:15,
                  color:black,
                  fontWeight: FontWeight.w500
                ))),
              ),
              SizedBox(height:30, width: 160),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child:Custombutton()
              ),
              SizedBox(height: 40),
              Text("Or continue registering with", style: body.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color:black
              ),
                ),
              SizedBox(height:20),
            
              
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
