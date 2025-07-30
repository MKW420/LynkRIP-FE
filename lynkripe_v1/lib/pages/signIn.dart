import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lynkripe_v1/services/firebase/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../services/firebase/auth/firebase_auth_google.dart';
import '/constants.dart';

 class AuthSignInScreen extends StatefulWidget {
 
  static String id = 'login_screen';

  const AuthSignInScreen({Key? key}): super(key:key);

  @override
  State<AuthSignInScreen> createState() => _authStateScreen();
  
}

class _authStateScreen extends State<AuthSignInScreen>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  String? _error_msg;
 
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInBlocState>(
      listener: (context, state){
        if(state is SignInSuccess){
          setState(() {
            signInRequired = false;
          });

        }else if(state is SignInProcess){
          setState(() {
            signInRequired=true;
          });
        }
        else if(state is SignInFailure){
          setState(() {
            signInRequired = false;
            _error_msg = 'Invalid email or password';
          });
        }
    },
    child:Scaffold(
      backgroundColor: background,
        body:Column(
          
          children: [
            SizedBox(height:5),
            Image.asset('assets/logo.png', height: 270,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:20, vertical: 10),
              child:  TextField(
                controller: emailController,
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
                controller: passwordController,
                obscureText: true,
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
                child:TextButton(
                  onPressed: (){ 
                    context.read<SignInBloc>().add(SignInRequired(
                      emailController.text,
                      passwordController.text
                    ));
                },
                child: Text(
                  'Sign In'
                ) ,
  
                ),

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
                
              ],) ,
             
               
           
                 
          ])
      )
    );
      
  }


 
  
}


