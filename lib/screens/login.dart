import 'package:flutter/material.dart';

class Login extends StatefulWidget{

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
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
                  padding: EdgeInsets.fromLTRB(30.0, 150.0, 0.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        height: 0.9
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Get '),
                        TextSpan(text: 'Hyred\n', style: TextStyle(color: Theme.of(context).accentColor)),
                        TextSpan(text: 'Today'),
                        TextSpan(text: '.', style: TextStyle(color: Theme.of(context).accentColor))
                      ]
                    )
                  ),
                )
              ],
            )
          ),
          SizedBox(height: 25,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment(1, 0),
                  child: Text('Forgot Password?',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),
                  )
                ),
                SizedBox(height: 50,),
                Container(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    shadowColor: Theme.of(context).accentColor,
                    color: Theme.of(context).accentColor,
                    elevation: 5,
                    child: GestureDetector(
                      onTap: (){},
                      child: Center(
                        child: Text('LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      )
                    )
                  )
                ),
                SizedBox(height: 20),
                Container(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat'
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'New to Hyred? '),
                        TextSpan(text: 'Register Today!', 
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            decoration: TextDecoration.underline
                          )
                        )
                      ]
                    ),
                  )
                )
              ]
            )
          ),
        ],
      )
    );
  }
}