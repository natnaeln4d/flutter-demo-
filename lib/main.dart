import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/Screen/home.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// void main(){
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ቤተ';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        primarySwatch: Colors.brown,


        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0,),
              //make border radius more than 50% of square height & width
              child: Image.asset(
                'assets/image/images.jpeg',
                fit: BoxFit.contain,
                height: 42,
                width: 42,

              ),
            )
           ,

            Container(
                padding: const EdgeInsets.all(6.0), child: Text('ቤተ Mezmur'))
          ],

        ),),
            body: const MyStatefulWidget(),

      ),
    );

  }
}

class MyStatefulWidget extends StatefulWidget {

  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String errorMessage = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ቤተ ክህነት',
                  style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w500,
                      fontFamily: "nano",
                      fontSize: 34),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),

              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPassword(),
                  ),
                );
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                   LoginCheck();
                  },
                )
            ),
            if (errorMessage.isNotEmpty)
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(title:'ቤተ'),
                      ),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Text(_success == null
            //       ? ''
            //       : (_success
            //       ? 'Successfully registered ' + _userEmail
            //       : 'Registration failed')),
            // )

          ],
        ));
  }
  Future LoginCheck() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: nameController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = 'Invalid credentials. Please try again.';
      });
    }
  }

}
class Signup extends StatefulWidget {
  const Signup({Key? key,required this.title}):super(key:key);
  final String title;

  @override
  State<Signup> createState() => _MySignUpPage();
}

class _MySignUpPage extends State<Signup>{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfrimController = TextEditingController();
  @override

  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar:AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0,),
                //make border radius more than 50% of square height & width
                child: Image.asset(
                  'assets/image/images.jpeg',
                  fit: BoxFit.contain,
                  height: 42,
                  width: 42,

                ),
              )
              ,

              Container(
                  padding: const EdgeInsets.all(6.0), child: Text('ቤተ Mezmur'))
            ],

          ),
        ),
      body:
          Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'ቤተ ክህነት',
                        style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.w500,
                            fontFamily: "nano",
                            fontSize: 34),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordConfrimController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confrim Password',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text('Forgot Password',),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Regsiter'),
                        onPressed:()=>{
                          if(passwordController.text == passwordConfrimController.text){
                            Register()
                          }
                          else{
                           print("password don't match")
                          }
                        }
                      )
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     const Text('have account?'),
                  //     TextButton(
                  //       child: const Text(
                  //         'Sign in',
                  //         style: TextStyle(fontSize: 20),
                  //       ),
                  //       onPressed: () {
                  //        Navigator.push(context, MaterialPageRoute(builder:(context)=>
                  //            _MyStatefulWidgetState()
                  //        ));
                  //       },
                  //     )
                  //   ],
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  // ),
                ],
              ))
      );
  }
  Future Register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nameController.text.trim(), password: passwordController.text.trim()
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

}

class ForgetPassword extends StatefulWidget{
  const ForgetPassword({Key? key}):super(key: key);

  @override
  State<ForgetPassword> createState() => MyForgetPasswordPage();

}

class MyForgetPasswordPage extends State<ForgetPassword>{
  String errorMessage = '';
  TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar:AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0,),
                //make border radius more than 50% of square height & width
                child: Image.asset(
                  'assets/image/images.jpeg',
                  fit: BoxFit.contain,
                  height: 42,
                  width: 42,

                ),
              )
              ,

              Container(
                  padding: const EdgeInsets.all(6.0), child: Text('ቤተ Mezmur'))
            ],

          ),
        ),
        body:
            Center(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.w500,
                              fontFamily: "nano",
                              fontSize: 34),
                        )),

                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                      ),
                    ),


                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                            child: const Text('Submit'),
                            onPressed:()=>{

                            }
                        )
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     const Text('have account?'),
                    //     TextButton(
                    //       child: const Text(
                    //         'Sign in',
                    //         style: TextStyle(fontSize: 20),
                    //       ),
                    //       onPressed: () {
                    //        Navigator.push(context, MaterialPageRoute(builder:(context)=>
                    //            _MyStatefulWidgetState()
                    //        ));
                    //       },
                    //     )
                    //   ],
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    // ),
                  ],
                ))

    );
  }
  Future Forget() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: nameController.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = 'Please try again.';
      });
    }
  }

}


