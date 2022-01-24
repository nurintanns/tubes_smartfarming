import 'package:flutter/material.dart';
import 'package:smartfarming/utils/app_colors.dart';
import 'package:smartfarming/utils/ui_helper.dart';
import 'package:smartfarming/widgets/custom_divider_view.dart';
import 'package:smartfarming/widgets/dotted_seperator_view.dart';

class AccountScreen extends StatelessWidget {
  final List<String> titles = [
    'My Account',
    'SUPER Expired',
    'Swiggy Money',
    'Help',
  ];
  final List<String> body = [
    'Address, Payments, Favourties, Referrals & Offers',
    'You had a great savings run. Get SUPER again',
    'Balance & Transactions',
    'FAQ & Links',
  ];

  AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _AppBar(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: titles.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _ListItem(
                  title: titles[index],
                  body: body[index],
                  isLastItem: (titles.length - 1) == index,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10.0),
                height: 50.0,
                child: Text(
                  'LOGOUT',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subtitleStyle = Theme.of(context).textTheme.bodyText1;

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'VINOTH',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              InkWell(
                child: Text(
                  'EDIT',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 17.0, color: darkOrange),
                ),
                onTap: () {},
              )
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            children: <Widget>[
              Text('8870123456', style: subtitleStyle),
              UIHelper.horizontalSpaceSmall(),
              ClipOval(
                child: Container(
                  height: 3.0,
                  width: 3.0,
                  color: Colors.grey[700],
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Text('vinothvino@icloud.com', style: subtitleStyle)
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          const CustomDividerView(
            dividerHeight: 1.8,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.title,
    required this.body,
    this.isLastItem = false,
  })  : assert(title != '', body != ''),
        super(key: key);

  final String title;
  final String body;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 15.0),
                    ),
                    UIHelper.verticalSpaceExtraSmall(),
                    Text(
                      body,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              UIHelper.horizontalSpaceSmall(),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          isLastItem
              ? const SizedBox()
              : const CustomDividerView(
                  dividerHeight: 0.8,
                  color: Colors.black26,
                ),
        ],
      ),
    );
  }
}
