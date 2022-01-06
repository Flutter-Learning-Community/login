// ignore_for_file: override_on_non_overriding_member, camel_case_types, annotate_overrides, unnecessary_new, duplicate_ignore

import 'dart:html';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final _formKey = GlobalKey<FormState>();

  String _userName = '';
  String _password = '';
  
  
  
  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userName);
      debugPrint(_password);
    }
  }
  TextEditingController _nameController = TextEditingController();
  bool text=true;
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          
      appBar: AppBar(
        title: Text('Login-page',style: GoogleFonts.lato(),),
        
      ),
      
      // ignore: unnecessary_new
      body: new Container(
        
        
        
         alignment: Alignment.center,
        
        // ignore: prefer_const_constructors
        padding: new EdgeInsets.all(300.250),
        
        child: Form(key: _formKey,
        child: Column(
       
       
        children: [
         
           
          Text("Login-Page", style:new TextStyle(fontSize: 25.0,fontWeight:FontWeight.bold),),
          
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(hintText:"Name",labelText: "Name",errorText:null,labelStyle:TextStyle(
              fontSize: 24,
              color: Colors.black,
              
            ) ,
            suffixIcon: Icon(Icons.person,color:Colors.black, ),

            border: OutlineInputBorder(),
            ), 
             validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 4) {
                            return 'Username must be at least 4 characters in length';
                          }
                          // Return null if the entered username is valid
                          return null;
                        },
                        onChanged: (value) => _userName = value,
            ),
            SizedBox(
           width: 10.0,
            height: 25.0,
            ),
            TextFormField(
                          obscureText: text,

              
            decoration: InputDecoration(hintText:"Your password",labelText: "Password",errorText:null,labelStyle:TextStyle(
              fontSize: 24,
              color: Colors.black,
            ) ,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              color:Colors.black,
              icon: Icon(Icons.remove_red_eye),
              onPressed: ()
              {
               setState(() {
              text=! text;
              });
              },
            )
            ), 
            validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          // Return null if the entered password is valid
                          return null;
                        },
                        onChanged: (value) => _password = value,
                      ),  
                      
            
          
            

    Container(
        alignment: Alignment.centerRight,
        padding: new EdgeInsets.all(20.0),
        child: new Text("Forget Password....?",style:new TextStyle( fontSize: 15.0,color: Colors.green,)),
          ),
     
// ignore: deprecated_member_use
RaisedButton(
  padding:EdgeInsets.symmetric(vertical: 28,horizontal: 50) ,
  onPressed: _trySubmitForm,
child: Text("Submit", style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,),),      
color: Colors.green,  
shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
 )
], 
        ), 
       )
  )
    
),
    );
    
  }
}
