import 'dart:convert';
import 'package:chang05/IP/ip.dart';
import 'package:chang05/common/header_widget.dart';
import 'package:chang05/transaction_consumer_provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  Future<void> refresh() async {
    var url = Uri.parse(
        'http://$ip/apidew/apiserverless-dew/authen/refreshprofile.php');
    var res = await http.post(url, body: {
      'id': '${context.read<UserProvider>().id}',
    });
    var resTojson = json.decode(res.body);
    if (res.statusCode == 200) {
      print("ติดต่อdataหน้าโปรไฟล์สำเร็จ");
    }
    setState(() {
      context.read<UserProvider>().id = resTojson['item']['id'];
      context.read<UserProvider>().username = resTojson['item']['username'];
      context.read<UserProvider>().firstname = resTojson['item']['firstname'];
      context.read<UserProvider>().lastname = resTojson['item']['lastname'];
      context.read<UserProvider>().email = resTojson['item']['email'];
      context.read<UserProvider>().ayer = resTojson['item']['ayer'];
      context.read<UserProvider>().datetime = resTojson['item']['datetime'];
      context.read<UserProvider>().line = resTojson['item']['line'];
      context.read<UserProvider>().numphon = resTojson['item']['numphon'];
      context.read<UserProvider>().facebook = resTojson['item']['facebook'];
      context.read<UserProvider>().address = resTojson['item']['address'];
      print("บันทึกข้อมูลจากdataลงappสำเร็จ");
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 100,
              child: HeaderRegister(100, false, Icons.house_rounded),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${context.read<UserProvider>().username}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Image.asset(
                                            "assets/iconprofile/user.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("ชื่อ-นามสกุลผู้ใช้"),
                                          subtitle: Text(
                                            '${context.read<UserProvider>().firstname} ' +
                                                ' ${context.read<UserProvider>().lastname}',
                                          ),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            "assets/iconprofile/cake.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("เกิดเมื่อ"),
                                          subtitle: Text(''),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            "assets/iconprofile/gmail.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("Email"),
                                          subtitle: Text(
                                            '${context.read<UserProvider>().email} ',
                                          ),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            "assets/iconprofile/telephone.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("Phone"),
                                          subtitle: Text(
                                            '${context.read<UserProvider>().numphon} ',
                                          ),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            "assets/iconprofile/line.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("LINE"),
                                          subtitle: Text(
                                            '${context.read<UserProvider>().line} ',
                                          ),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            "assets/iconprofile/facebook.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("FACEBOOK"),
                                          subtitle: Text(
                                            '${context.read<UserProvider>().facebook} ',
                                          ),
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Image.asset(
                                            "assets/iconprofile/placeholder.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("ที่อยู่"),
                                          subtitle: Text(
                                            '${context.read<UserProvider>().address} ',
                                          ),
                                        ),
                                        ListTile(
                                          leading: Image.asset(
                                            "assets/iconprofile/friend.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          title: Text("เป็นสมาชิกเมื่อ"),
                                          subtitle: Text(
                                            '${context.read<UserProvider>().datetime} ',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
