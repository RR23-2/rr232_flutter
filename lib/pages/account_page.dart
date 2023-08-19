import 'package:flutter/material.dart';
import 'package:rr23_2/pages/login_page.dart';

class AccountPage extends StatefulWidget {
  final String username;
  const AccountPage({super.key, required this.username});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10
            ),
            CircleAvatar(backgroundImage: AssetImage("assets/${widget.username}.jpg"), radius: 40,),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.username,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              )
            ),
            const SizedBox(
              width: 10
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context){
                    return const LoginPage();
                  }),
                  (route) => false
                );
              },
              child: const Text("Log out")
            )
          ],
        )
      ],
    );
  }
}