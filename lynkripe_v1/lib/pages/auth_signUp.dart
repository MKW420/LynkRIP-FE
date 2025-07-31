import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/pages/signIn_provider.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';
import '../services/firebase/auth/firebase_auth_google.dart';
import '/constants.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _authSignUpState();
}

class _authSignUpState extends State<SignUpScreen> {
   final passwordController = TextEditingController();
   final emailController = TextEditingController();
   final nameController = TextEditingController();
   bool signUpRequired = false;
   bool obscureText = true;
   
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc,SignUpState>(
      listener:(context, state){
        if(state is SignUpSuccess){
          setState((){
            signUpRequired = false;
          });    
        }
        else if(state is SignUpProcess){
          setState((){
            signUpRequired = true;
          });
        }
        else if(state is SignUpFailure){
          return;
        }
      },
  
    child:Scaffold(
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
                controller: nameController,
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
                controller: emailController,
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
               controller: passwordController,
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
             SizedBox(height:20),
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
              !signUpRequired ?
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child:TextButton(
                  onPressed: (){ 
                    MyUser myUser = MyUser.empty;
                    myUser = myUser.copyWith(
                      email: emailController.text,
                      name: nameController.text
                    );
                    setState((){
                      context.read<SignUpBloc>().add(SignUpRequired(
                      myUser,
                      passwordController.text
                    ));
                  });
                  
                },
                child: Text(
                  'Sign Up'
                ),),
              ): const CircularProgressIndicator(),
              SizedBox(height: 40),
              TextButton(
                onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => AuthSignIn()))},
                child: Text('Member?'),

              ),
              
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
                ),
                ),
              ],)     
          ])
      )
      );
  }
 }
 
//  ): const CircularProgressIndicator()
