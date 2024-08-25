import 'package:flutter/material.dart';
import 'package:login_reg_authentication/view/login/login.dart';

String regemail = "";
String regpswd = "";

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  final _formemail = GlobalKey<FormState>();
  TextEditingController pswdController = TextEditingController();
  final _formpswd = GlobalKey<FormState>();
  TextEditingController conPswdController = TextEditingController();
  final _formcpswd = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up for Free",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formemail,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Your Email Address",
                      border: OutlineInputBorder()),
                  controller: emailController,
                  validator: (value) {
                    if (emailController.text.contains("@")) {
                      regemail = value.toString();
                      return null;
                    } else {
                      return "Enter valied email address";
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formpswd,
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: "Your Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        Icons.visibility_off,
                        color: Color.fromARGB(255, 197, 194, 194),
                      ),
                    ),
                  ),
                  controller: pswdController,
                  validator: (value) {
                    if (pswdController.text.length > 4) {
                      regpswd = value.toString();
                      //print(regpswd);
                      return null;
                    } else {
                      return "Enter more than 4 characters";
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formcpswd,
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      hintText: "Your Confirm Password",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                            color: Color.fromARGB(255, 197, 194, 194),
                          ))),
                  controller: conPswdController,
                  validator: (value) {
                    if (value == regpswd) {
                      return null;
                    } else {
                      return "Please reenter valied password";
                    }
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _formemail.currentState!.validate();
                _formpswd.currentState!.validate();
                _formcpswd.currentState!.validate();
                if (emailController.text.isNotEmpty &&
                    pswdController.text.isNotEmpty &&
                    conPswdController.text.isNotEmpty &&
                    _formemail.currentState!.validate() == true &&
                    _formpswd.currentState!.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: 360,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 24, 33, 158),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
