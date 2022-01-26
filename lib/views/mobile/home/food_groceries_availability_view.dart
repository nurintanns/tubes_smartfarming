import 'package:flutter/material.dart';
import 'package:smartfarming/utils/app_colors.dart';
import 'package:smartfarming/utils/ui_helper.dart';
import 'package:smartfarming/views/mobile/home/lahan_page/Beranda/home_slider.dart';
import 'package:smartfarming/views/mobile/home/Plant/home.dart';
import 'package:smartfarming/views/mobile/home/Plant/main.dart';
import 'package:smartfarming/views/mobile/home/news/news_screen.dart';
import 'package:smartfarming/widgets/responsive.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'genie/genie_grocery_card_view.dart';
import 'lahan_page/Beranda/home_slider.dart';

class CarouselModel {
  var image;
  String i(String image) => image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/images/img1.jpg"},
  {"image": "assets/images/img2.jpg"},
  {"image": "assets/images/img3.jpg"},
];

class FoodGroceriesAvailabilityView extends StatefulWidget {
  const FoodGroceriesAvailabilityView({Key? key}) : super(key: key);

  @override
  State<FoodGroceriesAvailabilityView> createState() =>
      _FoodGroceriesAvailabilityView();
}

class _FoodGroceriesAvailabilityView
    extends State<FoodGroceriesAvailabilityView> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final BlueColor = Color(0xFF2C53B1);
  final GreyColor = Color(0xFFB4B0B0);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: <Widget>[
          if (!isTabletDesktop)
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                  child: Container(
                    width: 10.0,
                    height: 140.0,
                    color: swiggyOrange,
                  ),
                ),
                UIHelper.horizontalSpaceMedium(),
                Flexible(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'powered by passionate professionals & dreams about making agriculture more sustainable',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Text(
                        'The component of smartfarming technique is use of Information Technology and various technologies like sensors, automated hardware, and so on.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16.0,
                              color: Colors.grey[800],
                            ),
                      )
                    ],
                  ),
                )
              ],
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            child: Swiper(
              onIndexChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              itemCount: carousels.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(
                          carousels[index].image,
                        ),
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: map<Widget>(
                  carousels,
                  (index, image) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      height: 6,
                      width: 6,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? BlueColor : GreyColor),
                    );
                  },
                ),
              ),
              Text(
                'More...',
              )
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GenieGroceryCardView(
                title: 'Berita',
                subtitle: 'Anything you need,\ndelivered',
                image: 'assets/images/news.jpg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewsPage(),
                          ),
                        );
                      },
              ),
              GenieGroceryCardView(
                title: 'Lahan',
                subtitle: 'Essential \nland info',
                image: 'assets/images/land.jpg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageLahan(),
                          ),
                        );
                      },
              ),
              GenieGroceryCardView(
                title: 'Tumbuhan',
                subtitle: 'Interesting \nplant encyclopedia',
                image: 'assets/images/plant.jpg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      },
              ),
            ],
          )
        ],
      ),
    );
  }
}
