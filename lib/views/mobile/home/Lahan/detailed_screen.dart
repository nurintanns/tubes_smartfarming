import 'package:flutter/material.dart';
import 'package:smartfarming/views/mobile/home/Lahan/dataAPI/movie.dart';
import 'package:smartfarming/views/mobile/home/Lahan/lahan_view.dart';
import 'package:smartfarming/views/mobile/home/drawer.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: NavDrawer(),
          backgroundColor: Color(0xff558b2f),
          appBar: AppBar(
            title: Text(movie.nama_lahan),
            backgroundColor: Color(0xff33691e),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LahanHeader()),
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: 80,
                      height: 90,
                      color: Colors.lightBlue.shade300,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.water,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text("KADAR AIR " + movie.param2.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                              textAlign: TextAlign.center),
                          Text("("+movie.param2_timestamp+")",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
                              textAlign: TextAlign.center)
                        ],
                      )),
                  Container(
                      width: 80,
                      height: 90,
                      color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.cloud,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text(
                            "CURAH HUJAN " + movie.param3.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text("("+movie.param3_timestamp+")",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
                              textAlign: TextAlign.center)
                        ],
                      )),
                  Container(
                      width: 80,
                      height: 90,
                      color: Colors.greenAccent,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.water,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text("SUHU " + movie.param4.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                              textAlign: TextAlign.center),
                          Text("("+movie.param4_timestamp+")",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
                              textAlign: TextAlign.center)
                        ],
                      )),
                  Container(
                      width: 80,
                      height: 90,
                      color: Colors.orange,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.water_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text("KELEMBAPAN UDARA " + movie.param5.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                              textAlign: TextAlign.center),
                          Text("("+movie.param4_timestamp+")",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8),
                              textAlign: TextAlign.center)
                        ],
                      )),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 15,
                    child: DataTable(columns: <DataColumn>[
                      DataColumn(label: Text('Nama Lahan')),
                      DataColumn(label: Text(movie.nama_lahan)),
                    ], rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text('Luas Lahan Klonal')),
                        DataCell(Text(movie.luas_lahan_klonal.toString())),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('Luas Lahan Seedling')),
                        DataCell(Text(movie.luas_lahan_seedling.toString())),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('Luas Lahan Total')),
                        DataCell(Text(movie.luas_lahan_total.toString())),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('Satuan Luas Lahan')),
                        DataCell(Text('ha')),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text('Kemiringan')),
                        DataCell(Text(movie.param1.toString())),
                      ]),
                    ]),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Card(
                elevation: 15,
                child: Container(
                  width: 320,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        DataTable(
                          columns: <DataColumn>[
                            DataColumn(
                                label: Text(
                              "Rekomendasi",
                            )),
                          ],
                          rows: <DataRow>[
                            DataRow(cells: <DataCell>[
                              DataCell(Text(movie.rekomendasi1)),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(Text(movie.rekomendasi2)),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(Text(movie.rekomendasi3)),
                            ]),
                            DataRow(cells: <DataCell>[
                              DataCell(Text(movie.rekomendasi4)),
                            ]),
                          ],
                        ),
                      ]),
                ),
              )
            ]),
          )),
    );
  }
}
