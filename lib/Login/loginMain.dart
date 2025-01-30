import 'package:flutter/material.dart';
import 'package:my_app/Login/MainPage.dart';
import 'package:my_app/Login/loginMain.dart';
import 'package:my_app/Login/signup_page.dart';
import 'package:my_app/drawer/homeScreen.dart';
import 'package:my_app/views/myHomePage.dart';

class Loginmain extends StatefulWidget {
  const Loginmain({super.key});

  @override
  State<Loginmain> createState() => _MyHomeState();
}

class _MyHomeState extends State<Loginmain> {
  // final _formKey = GlobalKey<FormState>();
  bool obs = true;

  void onTabObsText() {
    setState(() {
      obs = !obs;
    });
  }
  

  Widget UserText() {
    return SizedBox(
      //height: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
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
        // validator: (String? val) {
        //   if (val!.isEmpty) {
        //     return 'ກະລຸນາປ້ອນຊື່ຂອງເຈົ້າ';
        //   }
        //   return null;
        // },
      ),
    );
  }

  Widget Password() {
    return SizedBox(
      //height: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
       // obscureText: obs,
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
          suffixIcon: obs
              ? IconButton(
                  onPressed: onTabObsText, icon: Icon(Icons.visibility_off))
              : IconButton(
                  onPressed: onTabObsText, icon: Icon(Icons.visibility)),
          label: Text('Password'),
        ),
        // validator: (String? val) {
        //   if (val!.isEmpty) {
        //     return 'ກະລຸນາປ້ອນລະຫັດຜ່ານຂອງເຈົ້າ';
        //   } else if (val!.length < 8) {
        //     return 'ລະຫັດຜ່ານຕ້ອງຫລາຍກວ່າ 8 ຕົວອັກສອນ';
        //   }
        // },
      ),
    );
  }

  Widget LogInButton() {
    return Container(
      width: 150,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        onPressed: () {
          // if (_formKey.currentState!.validate()) {
          //   _formKey.currentState!.save();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomeScreen()));
          // } else {
          //   print('you can not signed up');
          // }
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
        backgroundColor: Colors.orange,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (c) => SignupPage()));
      },
      child: Text(
        "Sign Up",
        style: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
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

  Widget _Text() {
    return Text(
      "Login",
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget Logo() {
    return CircleAvatar(
        radius: 50, backgroundImage: NetworkImage('https://thumbs.dreamstime.com/b/vector-illustration-isolated-white-background-login-button-icon-login-icon-button-127004144.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(shrinkWrap: true, children: [
              Column(
                children: [
                  Logo(),
                  SizedBox(
                    height: 15,
                  ),
                  _Text(),
                  SizedBox(
                    height: 15,
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
            ]),
          ),
        ),
      ),
    );
  }
}
