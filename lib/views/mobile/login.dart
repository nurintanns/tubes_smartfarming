import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartfarming/main.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:smartfarming/views/mobile/home_bottom_navigation_screen.dart';
import 'package:smartfarming/utils/app_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: swiggyOrange,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 30),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.orange),
                        hintText: "Masukkan Email",
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.orange,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      maxLines: 1,
                      obscureText: _isHidePassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Kata Sandi",
                        labelStyle: TextStyle(color: Colors.orange),
                        hintText: "Masukkan Kata Sandi",
                        prefixIcon: Icon(Icons.lock, color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            onPrimary: Colors.white,
                            textStyle: TextStyle(fontSize: 15)),
                        onPressed: () => {
                              submit(
                                context,
                                _emailController.text,
                                _passwordController.text,
                              ),
                            })
                  ],
                ),
              ),
            ),
          ],
        )));
  }

  void submit(BuildContext context, String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Email dan password harus diisi"),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    AlertDialog alert = AlertDialog(
      title: Text("Login Berhasil"),
      content: Container(
        child: Text("Selamat Anda Berhasil login"),
      ),
      actions: [
        TextButton(
          child: Text(
            'OK',
            style: TextStyle(color: Colors.orange),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HomeBottomNavigationScreen()));
          },
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }
}
