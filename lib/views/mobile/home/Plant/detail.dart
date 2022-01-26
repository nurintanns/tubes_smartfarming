import 'package:flutter/material.dart';

import 'home.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            _productImage(),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 18, top: 28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.grey.shade200,
                  ),
                  child: _productDescription()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: 300,
              decoration: new BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.elliptical(300, 50)),
              ),
            ),
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/${product.image}',
            height: 350,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _productDescription() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${product.title}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          'About',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Text(
            '${product.desc}',
          ),
        ),
        SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 48,
        ),
      ],
    );
  }
}
