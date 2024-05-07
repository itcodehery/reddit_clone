import 'package:flutter/material.dart';
import 'package:reddit_clone/main.dart';

enum AuthMode { Login, SignUp }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = true;
  AuthMode authMode = AuthMode.Login;
  final String continuing =
      'By continuing, you agree to our User Agreement and acknowledge that you understand the Privacy Policy.';

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
                  ButtonSegment(value: AuthMode.Login, label: Text('Login')),
                  ButtonSegment(value: AuthMode.SignUp, label: Text('Sign Up')),
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
                  labelText: isLogin ? 'Username' : 'Enter a username',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: isLogin ? 'Password' : 'Enter a password',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyApp(),
                      ));
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
