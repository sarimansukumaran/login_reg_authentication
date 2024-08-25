import 'package:flutter/material.dart';
import 'package:login_reg_authentication/view/home_screen/home_screen.dart';
import 'package:login_reg_authentication/view/registration/registration.dart';

String logemail = "";
String logpswd = "";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formemail = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final _formpswd = GlobalKey<FormState>();
  TextEditingController pswdController = TextEditingController();
  bool _obscureText = true;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign in to Your Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formemail,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your Email Address",
                    border: OutlineInputBorder(),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (emailController.text.contains("@")) {
                      logemail = value.toString();

                      return null;
                    } else {
                      return "Please enter valied email address";
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
                  //obscureText: true,
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
                          ))),
                  controller: pswdController,
                  validator: (value) {
                    if (pswdController.text.length > 4) {
                      logpswd = value.toString();
                      return null;
                    } else {
                      return "Please enter valied password";
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                    icon: Icon(_isChecked
                        ? Icons.check_box
                        : Icons.check_box_outline_blank)),
                Text("Remember Me"),
                SizedBox(
                  width: 100,
                ),
                TextButton(onPressed: () {}, child: Text("Forget Password"))
              ],
            ),
            InkWell(
              onTap: () {
                _formemail.currentState!.validate();
                _formpswd.currentState!.validate();
                if (logemail == regemail && logpswd == regpswd) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
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
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 450,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration()));
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
