import 'package:flutter/material.dart';
import 'package:ownnotes/constants/routes.dart';
import 'package:ownnotes/services/auth/auth_service.dart';

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
          title: const Text("verify email"),
        ),
        body: Column(
          children: [
            const Text(
              "W've sent you an email verification, please open to verify your account",
            ),
            Text(
              "If you haven't received an email, press the button below",
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
              },
              child: const Text("send email verification"),
            ),
            TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(registerRoute, (route) => false);
              },
              child: const Text("Restart"),
            )
          ],
        ));
  }
}
