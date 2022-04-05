import 'package:flutter/material.dart';
import 'user_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: Image(
                image: NetworkImage('https://www.pngitem.com/pimgs/m/111-1114675_user-login-person-man-enter-person-login-icon.png'),
                fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 50,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      'Sign Up',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 5, top: 5),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    )
                  ),
                ),
                Container(
                  height: 60,
                  width: 150,
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                      style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.blueAccent)

                          )
                      )
                    ),
                    child: Text('Create Account'),
                    onPressed: () {

                        Future<UserCredential> result = FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                        result.then((value)
                            {
                              print("Successfully signed up");
                              Navigator.pop(context);
                            });
                        result.catchError((error) {
                          print("Signup Failed");
                          print(error.toString());
                        });
                    }
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                    child: Text(
                        'App Logo',
                    )
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.book),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.computer),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
