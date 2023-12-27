import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Loading Screen',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor:
            Colors.blueGrey[400], // Sesuaikan dengan warna navy
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ), // Sesuaikan warna teks jika diperlukan
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigasi ke halaman login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200.0, // Sesuaikan dengan lebar yang diinginkan
                height: 200.0, // Sesuaikan dengan tinggi yang diinginkan
                child: Image(image: AssetImage('image/paw.png')),
              ),
              SizedBox(height: 20.0), // Spasi antara gambar dan teks
              Text(
                "Per Pus",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
