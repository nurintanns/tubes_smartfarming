import 'package:flutter/material.dart';
import 'package:smartfarming/views/mobile/home/news/news_list_item.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class DetailsScreen extends StatelessWidget {
  final String tag;
  final ListItem item;

  DetailsScreen({Key? key, required this.item, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: '${item.newsTitle}',
                      child: Image.network(item.imgUrl)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Text(
                          item.newsTitle,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.person),
                            Text(
                              item.author,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(Icons.date_range),
                            Text(
                              item.date,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "JAKARTA - Setelah semalam menghadiri Haul Ki Ageng Gribig di Jatinom, Klaten, Jawa Tengah, Menteri Koordinator Bidang Perekonomian Airlangga Hartarto hari ini blusukan ke sawah meninjau lokasi pertanian yang dikembangkan oleh petani milenial dengan konsep smart farming di Klaten, Jawa Tengah. Airlangga pun rela menceburkan diri ke sawah dengan boot penuh lumpur demi melihat Program Millenial Smartfarming yang dikembangkan petani milenial asal Klaten bernama Hartoyo. Menurut Airlangga program smart framing merupakan ekosistem pemberdayaan milenial melalui pembinaan dan pengembangan ekosistem pertanian digital (IoT) dari hulu ke hilir serta meningkatkan Inklusi Keuangan Desa.",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
