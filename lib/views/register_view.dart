import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';
import '../utils/string_utils.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.title});

  final String title;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text(registerString),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Text(loadString);

            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    controller: _emailController,
                    autocorrect: false,
                    // enableSuggestions: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(hintText: enterEmailString),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration:
                        const InputDecoration(hintText: enterPasswordString),
                  ),
                  TextButton(
                    onPressed: () async {
                      _registerUser(
                        _emailController!.text,
                        _passwordController!.text,
                      );
                    },
                    child: const Text(registerString),
                  ),
                ],
              );
          } // end switch
        },
      ),
    );
  }

  Future<UserCredential> _registerUser(
      final String email, final String password) async {
    // TODO: validate email

    // TODO: validate password

    // TODO: hash password

    final UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return credential;
  }
}
