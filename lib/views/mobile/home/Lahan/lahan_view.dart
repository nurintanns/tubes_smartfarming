import 'package:flutter/material.dart';
import 'package:smartfarming/views/mobile/home/Lahan/dataAPI/prediksi.dart';
import 'package:smartfarming/views/mobile/home/Lahan/lahan_repository.dart';
import 'package:smartfarming/views/mobile/home/Lahan/dataAPI/movie.dart';
import 'package:smartfarming/views/mobile/home/Lahan/detailed_screen.dart';
import 'package:smartfarming/views/mobile/home/submit_form.dart';
import 'package:smartfarming/views/mobile/home/Beranda/home_slider.dart';

class LahanHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff558b2f),
        appBar: new AppBar(
            title: new Text(
              "Informasi Lahan",
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
        body: LahanCard());
  }
}

class LahanCard extends StatefulWidget {
  @override
  _LahanCardState createState() => _LahanCardState();
}

class _LahanCardState extends State<LahanCard> {
  int currentPage = 1;
  List<Movie> movies = <Movie>[];
  ScrollController scrollController = ScrollController();
  late int totalResult;

  bool onNotification(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollUpdateNotification) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        setState(() {
          currentPage += 1;
          LahanRepository.fetchMovie(currentPage).then((response) {
            if (response != null) {
              setState(() {
                movies.addAll(response);
              });
            }
          });
        });
      }
    }
    return true;
  }

  @override
  void initState() {
    LahanRepository.fetchMovie(currentPage).then((value) {
      setState(() {
        movies.addAll(value);
        //totalResult = value.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: movies == null || movies.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NotificationListener(
                onNotification: onNotification,
                child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    var kadarAir = Text('Kadar Air ' + movies[index].param2);
                    var curahHujan =
                        Text('Curah Hujan ' + movies[index].param3);
                    var suhu = Text('Suhu ' + movies[index].param4);
                    var kelembapan = Text('Kelembapan ' + movies[index].param5);
                    if (movies[index].param2 != '-') {
                      if (int.parse(movies[index].param2.replaceAll('%', '')) >=
                          35) {
                        kadarAir = Text('Kadar Air ' + movies[index].param2 + '%',
                            style: TextStyle(color: Colors.red));
                      }
                    }
                    if (movies[index].param3 != '-') {
                      if (int.parse(movies[index].param3.replaceAll(' mm/hari', '')) >=
                          200) {
                        curahHujan = Text('Curah Hujan ' + movies[index].param3 + "mm/hari",
                            style: TextStyle(color: Colors.red));
                      }
                    }
                    if (movies[index].param4 != '-') {
                      if (int.parse(movies[index].param4.replaceAll(' C', '')) >=
                          25) {
                        suhu = Text('Suhu ' + movies[index].param4,
                            style: TextStyle(color: Colors.red));
                      }
                    }
                    if (movies[index].param5 != '-') {
                      if (int.parse(movies[index].param5.replaceAll(' %RH', '')) <=
                          50) {
                        kelembapan = Text('Kelembapan ' + movies[index].param5 + '%RH',
                            style: TextStyle(color: Colors.red));
                      }
                    }
                    return Center(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Lahan ' + movies[index].nama_lahan,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            kadarAir,
                            curahHujan,
                            suhu,
                            kelembapan,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: Text("Info"),
                                  onPressed: () => {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                movie: movies[index])))
                                  },
                                ),
                                TextButton(
                                  child: Text("Prediksi"),
                                  onPressed: ()  async {
                                    Prediksi predict = await Prediksi.fetchPrediksi(movies[index].id_lahan);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SubmitFormHeader(prediksi: predict,)));
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: movies.length,
                )),
        backgroundColor: Color(0xff558b2f));
  }
}
