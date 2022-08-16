import 'dart:convert';

import 'package:chang05/IP/ip.dart';
import 'package:chang05/Login/Regster.dart';
import 'package:chang05/common/header_widget.dart';
import 'package:chang05/common/theme_helper.dart';
import 'package:chang05/customer/Home.dart';
import 'package:chang05/transaction_consumer_provider/transaction_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void examinelogin() async {
    var url = Uri.parse('http://$ip/apidew/apiserverless-dew/authen/sigin.php');
    var res = await http.post(url, body: {
      'username': '${usernameController.text}',
      'password': '${passwordController.text}',
    });
    var resTojson = json.decode(res.body);
    if (res.statusCode == 200) {
      print("ติดต่อdataสำเร็จ");
      if (resTojson['status'] == 'get successfull') {
        print("ผ่านเข้าสู่ระบบถูกต้อง");
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

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        print("ไม่ผ่านการเข้าสู่ระบบ");
        Alert(
          context: context,
          type: AlertType.warning,
          title: "NoUser",
          desc: "ไม่มีข้อมูลผู้ใช้",
          buttons: [
            DialogButton(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 144, 4, 4),
                Color.fromARGB(255, 199, 64, 52)
              ]),
            ),
            DialogButton(
              child: Text(
                "สมัคข้อมูล",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Regster()),
              ),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 144, 4, 4),
                Color.fromARGB(255, 199, 64, 52)
              ]),
            )
          ],
        ).show();
        print(resTojson);
      }
    } else {
      print("ติดต่อdataไม่สำเร็จ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true,
                    Icons.login_rounded), //let's create a common header widget
              ),
              SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(
                        20, 10, 20, 10), // This will be the login form
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ลงชื่อเข้าใช้บัญชีของคุณ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 30.0),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextField(
                                    controller: usernameController,
                                    textInputAction: TextInputAction.next,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('ชื่อผู้ใช้',
                                            'ใส่ชื่อผู้ใช้ของคุณ'),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 30.0),
                                Container(
                                  child: TextField(
                                    controller: passwordController,
                                    textInputAction: TextInputAction.next,
                                    obscureText: true,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'รหัสผ่าน', 'ใส่รหัสผ่านของคุณ'),
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      //Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
                                    },
                                    child: Text(
                                      "ลืมรหัสผ่านหรือไม่?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: ThemeHelper()
                                      .buttonBoxDecoration(context),
                                  child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Text(
                                        'เข้าสู่ระบบ'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onPressed: () {
                                      examinelogin();
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  //child: Text('Don\'t have an account? Create'),
                                  child: Text.rich(TextSpan(children: [
                                    TextSpan(text: "ยังไม่มีบัญชี?"),
                                    TextSpan(
                                      text: 'สร้าง',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Regster()));
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    ),
                                  ])),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 8, 10, 20),
                                    child: Text.rich(
                                      TextSpan(
                                        text: '< สมัครเป็นช่าง >',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                            Navigator.pop(
                                              context,
                                            );
                                          },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 52, 8, 175)),
                                      ),
                                    )),
                              ],
                            )),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
