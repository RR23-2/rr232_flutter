import 'package:flutter/material.dart';
import 'package:rr23_2/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? usernameError;
  String? passwordError;

  bool isAlphaNumeric(String string) {
    final RegExp alphaRegExp = RegExp(r'[a-zA-Z]');
    final RegExp numRegExp = RegExp(r'[0-9]');

    return alphaRegExp.hasMatch(string) && numRegExp.hasMatch(string);
  }

  bool validateUsername(String string){
    final RegExp validUsername = RegExp(r'^[a-z0-9_]+$');

    return validUsername.hasMatch(string);
  }

  void resetError(){
    setState(() {
      usernameError = null;
      passwordError = null;
    });
  }

  void handleLogin(){
    resetError();
    String username = usernameController.text;
    String password = passwordController.text;

    if(username.isEmpty){
      setState(() {
        usernameError = "Username must not be empty";
      });
      return;
    }
    if(password.isEmpty){
      setState(() {
        passwordError = "Password must not be empty";
      });
      return;
    }
    if(!isAlphaNumeric(password)){
      setState(() {
        passwordError = "Password must contain alphabets and numbers";
      });
      return;
    }
    if(!validateUsername(username)){
      setState(() {
        usernameError = "Username can only contain lowercase alphabets, numbers, and '_'";
      });
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context){
        return MainPage(username: username);
      }),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/logo.png", height: 50.0,),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                labelText: "Username",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
                errorText: usernameError,
                errorMaxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)
                  )
                ),
                errorText: passwordError,
                errorMaxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: handleLogin,
              child: const Text("Log In"),
              
            )
          ]),
      ),
    );
  }
}