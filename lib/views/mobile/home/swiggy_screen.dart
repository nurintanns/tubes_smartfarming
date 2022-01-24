import 'package:flutter/material.dart';
import 'package:smartfarming/models/spotlight_best_top_food.dart';
import 'package:smartfarming/utils/app_colors.dart';
import 'package:smartfarming/utils/ui_helper.dart';
import 'package:smartfarming/widgets/custom_divider_view.dart';
import 'package:smartfarming/widgets/responsive.dart';

import 'best_in_safety_view.dart';
import 'food_groceries_availability_view.dart';
import 'genie/genie_view.dart';
import 'in_the_spotlight_view.dart';
import 'indian_food/indian_food_view.dart';
import 'popular_categories_view.dart';
import 'swiggy_safety_banner_view.dart';

class SwiggyScreen extends StatelessWidget {
  const SwiggyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const FoodGroceriesAvailabilityView(),
                    const CustomDividerView(),
                    IndianFoodView(),
                    const CustomDividerView(),
                    InTheSpotlightView(),
                    const CustomDividerView(),
                    const SwiggySafetyBannerView(),
                    BestInSafetyViews(),
                    const CustomDividerView(),
                    const GenieView(),
                    const CustomDividerView(),
                    PopularCategoriesView(),
                    const LiveForFoodView(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildAppBar(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 60.0,
        child: Row(
          children: <Widget>[
            Text(
              'Smart Farming',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 21.0),
            ),
            UIHelper.horizontalSpaceExtraSmall(),
          ],
        ),
      );
}

class LiveForFoodView extends StatelessWidget {
  const LiveForFoodView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(15.0),
      height: 400.0,
      color: Colors.grey[200],
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'LIVE\nFOR\nFOOD',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.grey[400],
                      fontSize: 80.0,
                      letterSpacing: 0.2,
                      height: 0.8,
                    ),
              ),
              UIHelper.verticalSpaceLarge(),
              Text(
                'MADE BY FOOD LOVERS',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                'SWIGGY HQ, BANGALORE',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              UIHelper.verticalSpaceExtraLarge(),
              Row(
                children: <Widget>[
                  Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width / 4,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          Positioned(
            left: 140.0,
            top: 90.0,
            child: Image.asset(
              'assets/images/burger.png',
              height: 80.0,
              width: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
