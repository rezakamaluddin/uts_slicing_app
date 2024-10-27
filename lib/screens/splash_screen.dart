import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Background biru
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo utama di tengah
            Image.asset('logodana.png', width: 100),
            SizedBox(height: 20),
            // Teks selamat datang

            SizedBox(height: 100),
            // Teks keterangan di bawah
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dana Indonesia terdaftar dan diawasi oleh ",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  Image.asset('bank_indonesia_logo.jpeg', width: 24),
                  SizedBox(width: 4),
                  Image.asset('Kominfo_logo.jpeg', width: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
