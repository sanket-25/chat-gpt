import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../models/constants.dart';
import '../Home/home.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AuthScreen();
  }
}

class _AuthScreen extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    print(_enteredEmail);
    print(_enteredPassword);
    if (_isLogin) {
      try {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => MyHomePage()));
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {}
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.message ?? "Authentication Failed"),
        ));
      }
    } else {
      try {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        print(userCredentials);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => MyHomePage()));
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {}
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.message ?? "Authentication Failed"),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.transparent,
    //   body: Container(
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         image: AssetImage('assets/images/bg2.png'),
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //     child: Center(
    //       child: SingleChildScrollView(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Row(
    //               children: [
    //                 SizedBox(
    //                   width: 30,
    //                 ),
    //                 Text(
    //                   textAlign: TextAlign.start,
    //                   "Log-In",
    //                   style: TextStyle(
    //                       color: Color.fromARGB(255, 255, 255, 255),
    //                       fontSize: 24,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ],
    //             ),
    //             // Container(
    //             //   margin: const EdgeInsets.only(
    //             //     top: 30,
    //             //     bottom: 20,
    //             //     left: 20,
    //             //     right: 20,
    //             //   ),
    //             //   width: 200,
    //             //   child: const Text("LogIn"),
    //             // ),
    //             Card(
    //               margin: const EdgeInsets.all(20),
    //               child: SingleChildScrollView(
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(20),
    //                   child: Form(
    //                       key: _form,
    //                       child: Column(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           TextFormField(
    //                             decoration: const InputDecoration(
    //                               labelText: 'E-mail',
    //                             ),
    //                             keyboardType: TextInputType.emailAddress,
    //                             autocorrect: false,
    //                             textCapitalization: TextCapitalization.none,
    //                             validator: (value) {
    //                               if (value == null ||
    //                                   value.trim().isEmpty ||
    //                                   !value.contains('@')) {
    //                                 return 'Please return a valid E-mail Address';
    //                               } else {
    //                                 return null;
    //                               }
    //                             },
    //                             onSaved: (value) {
    //                               _enteredEmail = value!;
    //                             },
    //                           ),
    //                           TextFormField(
    //                             decoration: const InputDecoration(
    //                               labelText: 'Password',
    //                             ),
    //                             keyboardType: TextInputType.emailAddress,
    //                             obscureText: true,
    //                             validator: (value) {
    //                               if (value == null ||
    //                                   value.trim().length < 6) {
    //                                 return 'Password must be atleast 6 characters long...';
    //                               }
    //                               return null;
    //                             },
    //                             onSaved: (value) {
    //                               _enteredPassword = value!;
    //                             },
    //                           ),
    //                           const SizedBox(
    //                             height: 20,
    //                           ),
    //                           ElevatedButton(
    //                             style: ElevatedButton.styleFrom(
    //                               padding: const EdgeInsets.all(2),
    //                               backgroundColor:
    //                                   Theme.of(context).colorScheme.background,
    //                             ),
    //                             onPressed: _submit,
    //                             child: Text(_isLogin ? "Login" : "SignUp"),
    //                           ),
    //                           const SizedBox(
    //                             height: 8,
    //                           ),
    //                           TextButton(
    //                             onPressed: () {
    //                               setState(() {
    //                                 _isLogin = !_isLogin;
    //                               });
    //                             },
    //                             child: Text(_isLogin
    //                                 ? "Create An Account"
    //                                 : 'I already have an account, Login'),
    //                           ),
    //                         ],
    //                       )),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    //----------------working-----------------------------
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/openai-wordmark.svg',
              height: 30
            ),
            SizedBox(
              height: 130
            ),
            // Spacer(),
            Text(
              _isLogin ? 'Welcome Back' : "Create your account",
              style: TextStyle(
                color: MyColors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 5, left: 10, right: 20, bottom: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(142, 142, 142, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: MyColors.green,
                    width: 1,
                  ),
                ),
                hintText: 'Please enter your Email',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(224, 224, 224, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                ),
              ),
              textAlign: TextAlign.start,
              // controller: _pincodeController,
              cursorColor: MyColors.blue,
              // inputFormatters: [
              //   LengthLimitingTextInputFormatter(6),
              //   FilteringTextInputFormatter.digitsOnly,
              // ],
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    !value.contains('@')) {
                  return 'Please enter a valid E-mail Address';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                _enteredEmail = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 5, left: 10, right: 20, bottom: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(142, 142, 142, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.green, // Assuming MyColors.blue is not defined
                    width: 1,
                  ),
                ),
                hintText: 'Please enter your Password',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(224, 224, 224, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Nunito',
                ),
              ),
              textAlign: TextAlign.start,
              // controller: _pincodeController,
              cursorColor: Colors.blue, // Assuming MyColors.blue is not defined

              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return 'Password must be atleast 6 characters long...';
                }
                return null;
              },
              onSaved: (value) {
                _enteredPassword = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.green,
                  disabledBackgroundColor: MyColors.veryLightBlue,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _submit,
                child: Text(
                  _isLogin ? "Login" : "SignUp",
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => AuthScreen(),
                //     ),
                //   );
                // },
                // child: Text(
                //   'Continue',
                //   style: TextStyle(
                //     color: MyColors.white,
                //     fontSize: 15,
                //     fontWeight: FontWeight.w500,
                //     fontFamily: 'Nunito',
                //   ),
                // ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(
                    _isLogin ? " Sign Up" : ' Login',
                    style: TextStyle(
                      color: MyColors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class GoogleFonts {
  const GoogleFonts();
  static lato({required TextStyle TextStyle}) {}
}
