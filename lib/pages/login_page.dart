import 'package:amazonn/pages/home_page.dart';
import 'package:amazonn/utills/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();
  final imageloginUrl = "https://cdn5.vectorstock.com/i/1000x1000/89/24/social-media-network-profile-character-mobile-app-vector-23748924.jpg";

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()){
    setState(() {
      changebutton = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    setState(() {
      changebutton = false;
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(imageloginUrl),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Wellcome $name',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter UserName",
                            labelText: "User Name"),
                            validator: (value){
                              if (value!.isEmpty){
                                return "username cant be empty";
                              }
                              return null;
                            },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                         validator: (value){
                              if (value!.isEmpty){
                                return "password cant be empty";
                              }
                              else if (value.length < 6){
                                return "length should be 6";
                              }
                              return null;
                            },    
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.cyan,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 50 : 12),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changebutton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      )
                      /*  ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text('Login'),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.limeAccent),
                      )*/
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
