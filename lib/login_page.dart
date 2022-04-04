import 'package:flutter/material.dart';
import 'package:login_demo/signup_page.dart';
import 'user_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image(
                image: NetworkImage('https://www.pngitem.com/pimgs/m/111-1114675_user-login-person-man-enter-person-login-icon.png'),
                fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      'Login',
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
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ForgotPassword()),
                      // );
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.grey
                      )
                  )
                  ),
                ),
                Expanded(
                  child:
                  Container(
                    width: 150,
                    child: ElevatedButton(
                        style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.blueAccent)

                            )
                        )
                      ),
                      child: Text('Login'),
                      onPressed: () {
                          FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                          .then((value) {
                            print("Login Successful");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserProfilePage()),
                            );
                          }).catchError((error) {
                            print("Login Failed");
                            print(error.toString());
                          });
                      }
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupPage()),
                          );
                        },
                        child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.grey
                            )
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
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
