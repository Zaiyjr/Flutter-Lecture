import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/drawer/homeScreen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  Future signUp() async {
    final String url = 'http://localhost/flutter_login/register.php';
    final response = await http.post(Uri.parse(url), body: {
      'name': _usernameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      // 'confirm_password': _confirmPasswordController.text,
    });
  }

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
        validator: (String? val) {
          if (val!.isEmpty) {
            return 'ກະລຸນາປ້ອນຊື່ຂອງເຈົ້າ';
          } else {
            return null;
          }
        },
        controller: _usernameController,
      ),
    );
  }

  Widget Email() {
    return SizedBox(
      //height: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.email,
            color: Colors.amber[900],
            size: 35,
          ),
          label: Text('Email'),
        ),
        validator: (String? val) {
          if (!((val!.contains('@')) && (val!.contains('.com')))) {
            return 'ກະລຸນາປ້ອນອີເມວຂອງເຈົ້າ. ຕົວຢ່າງ. you@gmail.com';
          } else {
            return null;
          }
        },
        controller: _emailController,
      ),
    );
  }

  Widget Password() {
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
        validator: (String? val) {
          if (val!.isEmpty) {
            return 'ກະລຸນາປ້ອນລະຫັດຜ່ານຂອງເຈົ້າ';
          } else if (val!.length < 8) {
            return 'ລະຫັດຜ່ານຕ້ອງຫລາຍກວ່າ 8 ຕົວອັກສອນ';
          } else {
            return null;
          }
        },
        controller: _passwordController,
      ),
    );
  }

  Widget ReTypePassword() {
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
            Icons.lock,
            color: Colors.amber[900],
            size: 35,
          ),
          suffixIcon: obs
              ? IconButton(
                  onPressed: onTabObsText, icon: Icon(Icons.visibility_off))
              : IconButton(
                  onPressed: onTabObsText, icon: Icon(Icons.visibility)),
          label: Text('Re-Type Password'),
        ),
        validator: (String? val) {
          if (val!.isEmpty) {
            return 'ກະລຸນາຢືນຢັນລະຫັດຜ່ານຂອງເຈົ້າ';
          } else if (val! != _passwordController.text) {
            return 'ລະຫັດຜ່ານບໍ່ຄຶກັນ';
          }
          return null;
        },
        controller: _confirmPasswordController,
      ),
    );
  }

  Widget SignUpButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
      ),
      onPressed: () {
        print('You signed up');
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          Navigator.of(context).push(MaterialPageRoute(builder: (c)=>MyHomeScreen()));
        }
      },
      child: Text(
        "ລົງທະບຽນ",
        style: TextStyle(
            fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget Logo() {
    return CircleAvatar(
      radius: 50,
      backgroundImage:
          NetworkImage('https://thumbs.dreamstime.com/b/vector-illustration-isolated-white-background-login-button-icon-login-icon-button-127004144.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ໜ້າລົງທະບຽນ',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(shrinkWrap: true, children: [
              Column(
                children: [
                  Logo(),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  UserText(),
                  SizedBox(
                    height: 12,
                  ),
                  Email(),
                  SizedBox(
                    height: 12,
                  ),
                  Password(),
                  SizedBox(
                    height: 12,
                  ),
                  ReTypePassword(),
                  SizedBox(
                    height: 12,
                  ),
                  SignUpButton(),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
