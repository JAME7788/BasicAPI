import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20),
          //เรียกใช้งานjson
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              //<== ใส่ AsyncSnapshot หน้า snapshot
              // var data = json.decode(snapshot.data.toString()); <== jsonในเครื่อง ใส่snapshot.ได้หน้าดาต้า
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return MyBox(
                      snapshot.data[index]['title1'],
                      snapshot.data[index]
                          ['title2'], //<== snapshot.ได้หน้าดาต้า
                      snapshot.data[index]['Image_URL'],
                      snapshot.data[index]['detail']);
                },
                itemCount: snapshot.data.length,
              );
            },
            future: getData(),
            // DefaultAssetBundle.of(context).loadString('assets/data.json'), <== jsonในเครื่อง
          )),
    );
  }

  Widget MyBox(String title1, String title2, String Image_URL, String detail) {
    var v1, v2, v3, v4;
    v1 = title1;
    v2 = title2;
    v3 = Image_URL;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(10),
      // color: Colors.blue[200],
      height: 150,
      //ตกแต่งกรอบใส่รูป
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: NetworkImage(Image_URL),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.75), BlendMode.darken)),
      ),
      child: Column(
        //จัดlayoutให้สวยๆ
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title1,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title2,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: () {
              print("Next Page=>");
              //เชื้อมหน้าอ่านตอำป
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(v1, v2, v3, v4)));
            },
            child: Text("อ่านต่อ"),
          )
        ],
      ),
    );
  }

//APi จาก web
  Future getData() async {
    //https://raw.githubusercontent.com/JAME7788/BasicAPI/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/JAME7788/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
