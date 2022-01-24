import 'package:flutter/material.dart';
import 'package:smartfarming/utils/app_colors.dart';
import 'package:smartfarming/utils/ui_helper.dart';
import 'package:smartfarming/views/mobile/home/news/news_detail.dart';
import 'package:smartfarming/views/mobile/home/news/news_list_item.dart';
import 'package:smartfarming/views/mobile/home/news/news_list_widget.dart';
import 'package:smartfarming/views/mobile/home/news/news_screen.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with SingleTickerProviderStateMixin {
  List<ListItem> listTiles = [
    ListItem(
      "https://pict.sindonews.net/dyn/850/pena/news/2021/09/24/34/549760/boot-penuh-lumpur-airlangga-blusukan-ke-sawah-tinjau-smart-farming-di-klaten-xlu.jpeg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "28 Jan 2022",
    ),
    ListItem(
      "https://awsimages.detik.net.id/visual/2019/10/09/6367ad65-f390-45ca-8032-aca67bcf6870.jpeg?w=650",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "02 Feb 2022",
    ),
    ListItem(
      "https://cdn.antaranews.com/cache/730x487/2021/11/04/IMG-20211104-WA0096.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "14 Feb 2022",
    ),
    ListItem(
      "https://eljohnnews.com/wp-content/uploads/2019/10/petani-cuy.jpeg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "29 Mar 2022",
    ),
    ListItem(
      "http://bersamamedia.com/uploads/media/2021/06/mentan-ajak-petani-muda-terapkan-teknologi-smartfarming1623461639.jpeg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "30 Mar 2022",
    ),
    ListItem(
      "https://jagadtani.id/uploads/news/2019/11/situbondo-gunakan-smart-farming-16477b99011c15d.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "02 Apr 2022",
    ),
    ListItem(
      "https://cdn.antaranews.com/cache/730x487/2021/09/24/F974EE9B-06E9-4085-AF9E-DB05A4ECD141.jpeg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "18 Apr 2022",
    ),
    ListItem(
      "https://pict.sindonews.net/dyn/620/pena/news/2021/01/05/178/290382/bni-uji-coba-smart-farming-di-5-provinsi-qaw.jpg",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "20  2022",
    ),
  ];

  List<Tab> _tabList = [
    Tab(
      child: Text("Top"),
    ),
    Tab(
      child: Text("Popular"),
    ),
    Tab(
      child: Text("Trending"),
    ),
    Tab(
      child: Text("Editor Choice"),
    ),
    Tab(
      child: Text("Category"),
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text(
          "News Smartfarming",
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    item: listTiles[index],
                                    tag: listTiles[index].newsTitle,
                                  )));
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    item: listTiles[index],
                                    tag: listTiles[index].newsTitle,
                                  )));
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    item: listTiles[index],
                                    tag: listTiles[index].newsTitle,
                                  )));
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    item: listTiles[index],
                                    tag: listTiles[index].newsTitle,
                                  )));
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    item: listTiles[index],
                                    tag: listTiles[index].newsTitle,
                                  )));
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
