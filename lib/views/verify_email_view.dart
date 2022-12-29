import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/email_utils.dart';
import '../utils/string_utils.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(verifyEmailString),
      ),
      body: Column(
        children: [
          const Text(pleaseVerifyEmailString),
          TextButton(
            onPressed: () {
              sendEmailVerification(FirebaseAuth.instance.currentUser);
            },
            child: const Text(sendEmailVerificationString),
          ),
        ],
      ),
    );
  }
}
