import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:my_app/Login/loginMain.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
   bool isConnectedToInternet = false;
  StreamSubscription? _internetConnectionSubscription;
  Timer? _navigationTimer;

  @override
   void initState() {
    super.initState();
    _internetConnectionSubscription = InternetConnection()
        .onStatusChange
        .listen((event) {
      print(event);
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            isConnectedToInternet = true;
          });
          _showConnectionDialog("Connected", "You are connected to the Internet.", true);
          break;
        case InternetStatus.disconnected:
          setState(() {
            isConnectedToInternet = false;
          });
          _showConnectionDialog("Disconnected", "You are not connected to the Internet.", false);
          break;
        default:
          setState(() {
            isConnectedToInternet = false;
          });
          _showConnectionDialog("Unknown", "Connection status is unknown.", false);
          break;
      }
    });
  }

  void _showConnectionDialog(String title, String message, bool isConnected) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: isConnected
              ? [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _navigateToLoginWithDelay();
                    },
                    child: const Text("OK"),
                  ),
                ]
              : [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Retry"),
                  ),
                ],
        );
      },
    );
  }

  void _navigateToLoginWithDelay() {
    _cancelNavigation(); // Cancel any existing timer before starting a new one.
    _navigationTimer = Timer(const Duration(seconds: 5), () {
      if (isConnectedToInternet) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (c) => const Loginmain()),
        );
      }
    });
  }

  void _cancelNavigation() {
    _navigationTimer?.cancel();
  }

  @override
  void dispose() {
    _internetConnectionSubscription?.cancel();
    _navigationTimer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(isConnectedToInternet ? Icons.wifi : Icons.wifi_off,size: 50,color: isConnectedToInternet ? Colors.green : Colors.red),
            Text(isConnectedToInternet ? "ທ່ານເຊື່ອມຕໍ່ອິນເຕິເນັດແລ້ວ" : "ທ່ານຂາດການເຊື່ອມຕໍ່ອິນເຕິເນັດ"),
          ],
        ),
      ),
    );
  }
}