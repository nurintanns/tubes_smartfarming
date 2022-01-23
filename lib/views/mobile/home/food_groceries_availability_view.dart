import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/home/genie/genie_screen.dart';
import 'package:swiggy_ui/views/mobile/home/news/news_screen.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'genie/genie_grocery_card_view.dart';
import 'meat/meat_screen.dart';

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
                        'We are now deliverying food groceries and other essentials.',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Text(
                        'Food & Genie service (Mon-Sat)-6:00 am to 9:00pm. Groceries & Meat (Mon-Sat)-6:00 am to 6:00pm. Dairy (Mon-Sat)-6:00 am to 6:00pm (Sun)-6:00 am to 12:00 pm',
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

          // Stack(
          //   children: <Widget>[
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(10.0),
          //       child: InkWell(
          //         child: Container(
          //           height: 150.0,
          //           color: swiggyOrange,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.stretch,
          //             children: <Widget>[
          //               Align(
          //                 alignment: Alignment.topLeft,
          //                 child: FractionallySizedBox(
          //                   widthFactor: 0.7,
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(15.0),
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: <Widget>[
          //                         Text(
          //                           'Restaurants',
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .headline4!
          //                               .copyWith(color: Colors.white),
          //                         ),
          //                         UIHelper.verticalSpaceExtraSmall(),
          //                         Text(
          //                           'No-contact delivery available',
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .bodyText1!
          //                               .copyWith(color: Colors.white),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const Spacer(),
          //               Container(
          //                 height: 45.0,
          //                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //                 color: darkOrange,
          //                 child: Row(
          //                   children: <Widget>[
          //                     Text(
          //                       'View all',
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .bodyText1!
          //                           .copyWith(
          //                               color: Colors.white, fontSize: 18.0),
          //                     ),
          //                     UIHelper.horizontalSpaceSmall(),
          //                     const Icon(
          //                       Icons.arrow_forward,
          //                       color: Colors.white,
          //                       size: 18.0,
          //                     ),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: -10.0,
          //       right: -10.0,
          //       child: ClipOval(
          //         child: Image.asset(
          //           'assets/images/food1.jpg',
          //           width: 130.0,
          //           height: 130.0,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          UIHelper.verticalSpaceMedium(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GenieGroceryCardView(
                title: 'News',
                subtitle: 'Anything you need,\ndelivered',
                image: 'assets/images/food1.jpg',
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
                subtitle: 'Esentials delivered\nin 2 Hrs',
                image: 'assets/images/food4.jpg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GenieScreen(),
                          ),
                        );
                      },
              ),
              GenieGroceryCardView(
                title: 'Kamus',
                subtitle: 'Fesh meat\ndelivered safe',
                image: 'assets/images/food6.jpg',
                onTap: isTabletDesktop
                    ? () {}
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MeatScreen(),
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
