import 'package:flutter/material.dart';
import 'package:layout/pages/calc.dart';
import 'package:layout/pages/contact.dart';
import 'package:layout/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [HomePage(), calculatePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Microcontroller"),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, //หน้าปัจจุบันที่เลือก
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าแรก"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "คำนวณ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: "ติดต่อเรา"),
          ],
          onTap: (index) {
            setState(() {
              print(index);
              _currentIndex = index;
            });
          }),
    );
  }
}
