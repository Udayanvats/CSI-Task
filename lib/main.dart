import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdsc/views/login_view.dart';
import 'package:gdsc/views/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const Homepage(),
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
    },
  ));
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // final user = FirebaseAuth.instance.currentUser;

              // if (user?.emailVerified ?? false) {
              //   return const Text("Done");
              // } else {
              //   return const VerifyEmailView();
              // }
              return const LoginView();
            default:
              return const LinearProgressIndicator();
          }
        });
  }
}


