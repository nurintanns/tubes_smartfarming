import 'package:flutter/material.dart';
import 'package:smartfarming/views/mobile/home/lahan_page/Lahan/lahan_view.dart';
import 'package:smartfarming/views/mobile/home/lahan_page/Lahan/dataAPI/prediksi.dart';

class SubmitFormHeader extends StatelessWidget {
  const SubmitFormHeader({Key? key, required this.prediksi}) : super(key: key);
  final Prediksi prediksi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff558b2f),
        appBar: new AppBar(
            title: new Text(prediksi.nama_lahan),
            backgroundColor: Color(0xff33691e),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LahanHeader()),
                );
              },
            )),
        body: Container(
            width: 1,
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10)),
                Card(
                  elevation: 15,
                  child: DataTable(columns: <DataColumn>[
                    DataColumn(
                        label: Text(
                      'Estimasi Kebutuhan Unsur Hara N',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )),
                    DataColumn(
                        label: Text(
                      prediksi.n + ' Kg/Ha/Thn',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    )),
                  ], rows: <DataRow>[
                    DataRow(cells: <DataCell>[
                      DataCell(Text('Estimasi Kebutuhan Unsur Hara P')),
                      DataCell(Text(prediksi.p + ' Kg/Ha/Thn')),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('Estimasi Kebutuhan Unsur Hara K')),
                      DataCell(Text(prediksi.k + ' Kg/Ha/Thn')),
                    ]),
                    DataRow(cells: <DataCell>[
                      DataCell(Text('Estimasi Kebutuhan Unsur Hara Mg')),
                      DataCell(Text(prediksi.mg + ' Kg/Ha/Thn')),
                    ]),
                  ]),
                ),
              ],
            )));
  }
}
