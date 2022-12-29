import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/firebase/auth_exception_codes.dart';
import '../utils/string_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController? _emailController;
  late final TextEditingController? _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(loginString),
      ),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            autocorrect: false,
            // enableSuggestions: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: enterEmailString),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(hintText: enterPasswordString),
          ),
          TextButton(
            onPressed: () async {
              _loginUser(
                _emailController!.text,
                _passwordController!.text,
              );
            },
            child: const Text(loginString),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRouteName, (route) => false);
            },
            child: const Text(createAccountPrompt),
          ),
        ],
      ),
    );
  }

  dynamic _loginUser(String email, String password) async {
    try {
      final UserCredential credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credentials;
    } on FirebaseAuthException catch (e) {
      if (e.code == userNotFoundCode) {
        // TODO: handle user not found
      } else if (e.code == wrongPasswordCode) {
        // TODO: handle wrong password
      }
    }
  }
}
