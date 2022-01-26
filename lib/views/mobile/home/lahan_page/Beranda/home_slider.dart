import 'package:flutter/material.dart';
import 'package:smartfarming/views/mobile/home/lahan_page/Lahan/lahan_view.dart';
import 'package:smartfarming/views/mobile/home/lahan_page/Lahan/postAPI/lahan_post_data.dart';
import 'package:smartfarming/utils/app_colors.dart';

final List<String> imgList = [
  'https://pesonajatim.com/wp-content/uploads/2019/07/Kebun-Teh-Andung-Biru-2.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5MvKz1h3QZA-txTryWxPWUWmoZf-3_rT-0Q&usqp=CAU',
  'https://th.bing.com/th/id/OIP.CcRQjjC4BUgJ1iJRBZxk2QHaEa?w=290&h=180&c=7&r=0&o=5&dpr=1.05&pid=1.7',
  'https://th.bing.com/th/id/OIP.nOYq6NLcvCQ2iCO7AjRjxAHaFj?w=230&h=180&c=7&r=0&o=5&dpr=1.05&pid=1.7'
];

class HomePageLahan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: swiggyOrange,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Color(0xFFFAFAFA),
          centerTitle: true,
          title: Text(
            "Beranda Lahan",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LahanPostHeader()));
                        },
                        child: Card(
                          elevation: 15,
                          child: SizedBox(
                              height: 170,
                              width: 150,
                              child: ListTile(
                                title: Icon(Icons.note_add_sharp, size: 100),
                                subtitle: Text("Masukan Data Lahan",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              )),
                        )),
                  ),
                  GestureDetector(
                    child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LahanHeader()));
                        },
                        child: Card(
                          elevation: 15,
                          child: SizedBox(
                              height: 170,
                              width: 150,
                              child: ListTile(
                                title: Icon(Icons.info, size: 100),
                                subtitle: Text("Info Data Lahan",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              )),
                        )),
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 350.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
