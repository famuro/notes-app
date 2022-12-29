import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendEmailVerification(User? user) async {
  if (user == null) {
    Future.error(Exception('Error with the user.'));
  }

  await user!.sendEmailVerification();
}
