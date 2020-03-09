import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:main/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleRegister;
  Register({this.toggleRegister});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _passKey = GlobalKey<FormFieldState>();

  String email = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 90.0, 0.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          height: 0.9,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Hyred\n',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          TextSpan(text: 'Registration'),
                          TextSpan(
                              text: '.',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                        ]),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Please enter your email!' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        autocorrect: false,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        key: _passKey,
                        validator: (val) => val.length < 8
                            ? 'Passwords must be atleast 8 characters long!'
                            : null,
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) => val != _passKey.currentState.value
                            ? 'Passwords must match!'
                            : null,
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Retype Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment(1, 0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25)),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic res = await _auth.registerWithEmail(
                                  email, _passKey.currentState.value);
                              if (res == null) {
                                setState(() =>
                                    error = "Please supply a valid email!");
                              }
                            }
                          },
                          color: Theme.of(context).accentColor,
                          elevation: 5,
                          child: Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Montserrat'),
                            children: <TextSpan>[
                              TextSpan(text: 'Have an account? '),
                              TextSpan(
                                text: 'Sign in Here!',
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () => widget.toggleRegister(),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
