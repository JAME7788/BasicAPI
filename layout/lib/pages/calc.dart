import 'package:flutter/material.dart';

class calculatePage extends StatefulWidget {
  // const calculatePage({ Key? key }) : super(key: key);

  @override
  _calculatePageState createState() => _calculatePageState();
}

class _calculatePageState extends State<calculatePage> {
  TextEditingController quantity = TextEditingController(); //ฃ่องเก็บข้อมูล
  TextEditingController price = TextEditingController(); //ฃ่องเก็บข้อมูล
  //double price = 10;
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    //ฟังชั้นพิเศษไว้ตั้งค่าตอนแรก
    super.initState();
    result.text =
        "ซื้อแอปเปิ้ลจำนวน x ผล ราคาผลละ X บาท \n       รวมลูกค้าต้องจ่ายทั้งหมด x บาท";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
              child: Column(
            children: [
              Text(
                "โปรแกรมคำนวณ",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: "DUCK"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: price,
                  decoration: InputDecoration(
                      labelText: 'ราคาแอปเปิ้ล', border: OutlineInputBorder())),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: quantity,
                  decoration: InputDecoration(
                      labelText: 'จำนวนแอปเปิ้ล',
                      border: OutlineInputBorder())),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  var sum = int.parse(quantity.text) * int.parse(price.text);
                  print("Apple: ${quantity.text} Total : $sum B");
                  setState(() {
                    result.text =
                        "ซื้อแอปเปิ้ลจำนวน ${quantity.text} ผล ราคาผลละ  ${price.text} บาท \n       รวมลูกค้าต้องจ่ายทั้งหมด $sum บาท";
                  });
                },
                child: Text("คำนวณ"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(100, 20, 100, 20)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // color: Colors.green,
                        fontFamily: "DUCK"))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                result.text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontFamily: "DUCK"),
              )
            ],
          )),
        ),
      ],
    );
  }
}
