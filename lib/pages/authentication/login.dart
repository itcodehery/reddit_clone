import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reddit_clone/helper/shared_prefs_helper.dart';

enum AuthMode { login, signUp }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String errorMessage = '';
  bool isLogin = true;
  AuthMode authMode = AuthMode.login;

  //shared_prefs_key
  bool firstTimeLogin = false;

  //initState
  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.getBool('firstTimeLogin').then((value) {
      setState(() {
        firstTimeLogin = value;
      });
    });
  }

  //statics
  static String continuing =
      'By continuing, you agree to our User Agreement and acknowledge that you understand the Privacy Policy.';

  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  // Widget _errorSnackBar() {
  //   return SnackBar(
  //     content: Text(errorMessage),
  //     duration: const Duration(seconds: 3),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SegmentedButton(
                selectedIcon: const Icon(Icons.login),
                style: ButtonStyle(
                    side: MaterialStatePropertyAll(BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )),
                    foregroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary)),
                segments: const <ButtonSegment<AuthMode>>[
                  ButtonSegment(value: AuthMode.login, label: Text('Login')),
                  ButtonSegment(value: AuthMode.signUp, label: Text('Sign Up')),
                ],
                selected: <AuthMode>{authMode},
                onSelectionChanged: (Set<AuthMode> newSelection) {
                  setState(() {
                    authMode = newSelection.first;
                    isLogin = !isLogin;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                isLogin ? 'Welcome back to the hold' : 'Welcome to the hold',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                continuing,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Text(isLogin ? "Login" : "Sign Up",
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: isLogin ? 'Email' : 'Enter an email',
                ),
                controller: emailController,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: isLogin ? 'Password' : 'Enter a password',
                ),
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(
                    width: errorMessage == ""
                        ? 0
                        : MediaQuery.of(context).size.width - 150,
                    child: Chip(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide.none,
                        ),
                        label: Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.inversePrimary),
                      foregroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      isLogin
                          ? signInWithEmailAndPassword()
                          : {
                              signUpWithEmailAndPassword(),
                              SharedPreferencesHelper.saveBool(
                                  true, 'firstTimeLogin'),
                            };
                    },
                    child: Text(
                      isLogin ? "Login" : "Sign Up",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
