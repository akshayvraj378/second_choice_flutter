import 'package:flutter/material.dart';
import 'package:second_choice_flutter/controller/google_sign_in.dart';
import 'package:second_choice_flutter/view/registration_view.dart';

import '../../view/forgot_password_view.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  GoogleSignInController googleSignInController=GoogleSignInController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Form(
          key: loginKey,
          child: ListView(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(
                          child: Image(
                              image: AssetImage('assets/images/img16.jpg')),
                        ),
                        Container(
                          height: 650,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(45),
                              topLeft: Radius.circular(45),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.only(left: 15, bottom: 40),
                                      child: Text(
                                        'Welcome back!',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 18, right: 18),
                                child: Container(
                                  height: 280,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.white24,
                                        Colors.white38,
                                        Colors.blueGrey,
                                      ],
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 2,
                                        color: Colors.black12,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(11.0),
                                          child: Center(
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            'Email',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 19, right: 19),
                                          child: TextFormField(
                                            controller: emailController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your email';
                                              }
                                              if (!RegExp(
                                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                                  .hasMatch(value)) {
                                                return 'Enter a valid email address';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                  Icons.attach_email_outlined),
                                              hintText: 'Enter your email',
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: Text(
                                            'Password',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 19, right: 19),
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: obscurePassword,
                                            decoration: InputDecoration(
                                              prefixIcon:
                                              Icon(Icons.lock_clock),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    obscurePassword =
                                                    !obscurePassword;
                                                  });
                                                },
                                                icon: Icon(obscurePassword
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                              ),
                                              hintText: 'Enter your password',
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your password';
                                              }
                                              // Additional password validation can be added here if needed
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassword(),
                                            ));
                                      },
                                      child: Text('Forgot password'),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            Size(100, 40)),
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.blue),
                                      ),
                                      onPressed: () {
                                        if (loginKey.currentState!.validate()) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductList(),
                                              ));
                                        }
                                      },
                                      child: Text('Login'),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Do not have an account?',
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => New(),
                                            ));
                                      },
                                      child: Text('Register'),

                                    )
                                  ],
                                ),
                              ),
                              IconButton(onPressed: () {
                                setState(() {
                                  googleSignInController.signInWithGoogle();                                });
                              }, icon: Image(image: AssetImage('assets/images/google.jpg')))

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
