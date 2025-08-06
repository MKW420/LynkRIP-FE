
import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: white,
      ),

      
      body: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(children: [
            SizedBox(height:20.0),

           CircleAvatar(
                backgroundColor: primary,
                radius: 50,
                
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/hub.jpg'),

                )
              ),
              SizedBox(height:20.0),

              // Divider(),
              SizedBox(height:80.0),
              Form(child: 
              Column(
                children: [
                  
                  TextField(
                decoration: InputDecoration(
                hintText: 'First Name',
                prefixIcon: const Icon(Icons.verified_user, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
                ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
                  ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                hintText: 'Current Password',
                prefixIcon: const Icon(Icons.password_outlined, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
                  ),
                    SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                hintText: 'New Password',
                prefixIcon: const Icon(Icons.new_label, size: 20),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
                  ),

                  
                ]
              )
                  
                  ),
                  const SizedBox(height:100.0),
                  Row(children: [
                    SizedBox(
                      width:125,
                      height:50.0,
                      child: ElevatedButton(onPressed: (){},
                      style:ElevatedButton.styleFrom(
                         backgroundColor: lightPrimary,
                         foregroundColor: primary
                      ),
                       child: Text('cancel')
                       ),
                    ),
                      const SizedBox(width:16.0),
                      SizedBox(
                      width:210.0,
                      height:50.0,
                      child: ElevatedButton(onPressed: (){},
                      style:ElevatedButton.styleFrom(
                         backgroundColor: primary,
                         foregroundColor: lightPrimary
                      ),
                       child: Text('Save update')
                       ),
                    ),

                    
                   ]
                  ),
                    
                  ],)
                  
                  
            

              ));
          
     
        
        
    
        
  }
}
