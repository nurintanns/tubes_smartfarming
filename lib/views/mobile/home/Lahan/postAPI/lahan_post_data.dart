// @dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:swiggy_ui/views/mobile/home/Beranda/home_slider.dart';
import 'package:swiggy_ui/views/mobile/home/Lahan/postAPI/lahan_post_model.dart';
import 'package:http/http.dart' as http;

class LahanPostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
            title: new Text(
              "Masukkan Lahan",
            ),
            backgroundColor: Color(0xff33691e),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeSlider()),
                );
              },
            )),
        body: LahanPost());
  }
}

class LahanPost extends StatefulWidget {
  @override
  _LahanPostState createState() => _LahanPostState();
}

Future<LahanModel> submitData(String nama_lahan, String luas_lahan_klonal, String luas_lahan_total,
    String luas_lahan_seedling, String param1) async {
  Uri apiURL = Uri.parse("http://agriradar.id/api/web/v1/lahans/post-lahan");

  var apiResult = await http.post(apiURL, body: {
    "nama_lahan": nama_lahan,
    "luas_lahan_total": luas_lahan_total,
    "luas_lahan_seedling": luas_lahan_seedling,
    "param1": param1
  }, headers: {
    'Accept': 'application/x-www-form-urlencoded'
  });
  var data = apiResult.body;
  print(data);

  if (apiResult.statusCode == 201) {
    String responseString = apiResult.body;
    lahanModelFromJson(responseString);
  } else {
    return null;
  }
}

class _LahanPostState extends State<LahanPost> {
  LahanModel _lahanModel;
  TextEditingController nama_lahanController = TextEditingController();
    TextEditingController luas_lahan_klonalController = TextEditingController();
  TextEditingController luas_lahan_totalController = TextEditingController();
  TextEditingController luas_lahan_seedlingController = TextEditingController();
  TextEditingController param1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Masukan Nama Lahan'),
                  controller: nama_lahanController,
                ),
                /*    SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Masukkan Luas Lahan Klonal'),
                  controller: luas_lahan_klonalController,
                ),*/
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Masukkan Luas Lahan'),
                  controller: luas_lahan_totalController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Masukkan Luas Lahan Seedling'),
                  controller: luas_lahan_seedlingController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Masukkan Kemiringan tanah'),
                  controller: param1Controller,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                          textStyle: TextStyle(fontSize: 25)),
                      onPressed: () async {
                        String nama_lahan = nama_lahanController.text;
                        String luas_lahan_klonal = luas_lahan_klonalController.text;
                        String luas_lahan_total =
                            luas_lahan_totalController.text;
                        String luas_lahan_seedling =
                            luas_lahan_seedlingController.text;
                        String param1 = param1Controller.text;
                        print(nama_lahan +
                            luas_lahan_seedling +
                            luas_lahan_total +
                            param1);

                        LahanModel user = await submitData(nama_lahan, luas_lahan_klonal,
                            luas_lahan_total, luas_lahan_seedling, param1);
                        setState(() {
                          _lahanModel = user;
                        });
                      },
                      child: Text("Submit")),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xff558b2f));
  }
}
