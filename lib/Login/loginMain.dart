import 'package:flutter/material.dart';
import 'package:my_app/Login/MainPage.dart';
import 'package:my_app/Login/loginMain.dart';
import 'package:my_app/drawer/homeScreen.dart';
import 'package:my_app/views/myHomePage.dart';


class Loginmain extends StatefulWidget {
  const Loginmain({super.key});

  @override
  State<Loginmain> createState() => _MyHomeState();
}

class _MyHomeState extends State<Loginmain> {
  bool obs = true;

  void onTabObsText() {
    setState(() {
      obs = !obs;
    });
  }

  Widget UserText() {
    return SizedBox(
      //height: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.person,
            color: Colors.amber[900],
            size: 35,
          ),
          label: Text('Username'),
        ),
      ),
    );
  }

  Widget Password() {
    return SizedBox(
      //height: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        obscureText: obs,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.amber[900],
            size: 35,
          ),
          // suffixIcon: obs
          //     ? IconButton(
          //         onPressed: onTabObsText, icon: Icon(Icons.visibility_off))
          //     : IconButton(
          //         onPressed: onTabObsText, icon: Icon(Icons.visibility)),
          label: Text('Password'),
        ),
      ),
    );
  }

  Widget LogInButton() {
    return Container(
      width: 150,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MyHomeScreen(),
            ),
          );
        },
        child: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget SignUpButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber[900],
      ),
      onPressed: () {},
      child: Text(
        "Sign Up",
        style: TextStyle(fontSize: 32, color: Colors.white),
      ),
    );
  }

  Widget LogSigUpButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LogInButton(),
        SizedBox(
          width: 20,
        ),
        SignUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  ''),
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),
            ),
            UserText(),
            SizedBox(
              height: 15,
            ),
            Password(),
            SizedBox(
              height: 15,
            ),
            LogSigUpButton(),
            
          ],
        ),
      ),
    );
  }
}