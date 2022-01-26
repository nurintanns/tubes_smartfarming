import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartfarming/main.dart';
import 'package:smartfarming/views/mobile/home/Plant/detail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../food_groceries_availability_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _product = [
    Product(
      image: '1.png',
      title: 'Succulent Plant',
      desc:
          'In botany, succulent plants, also known as succulents, are plants with parts that are thickened, fleshy, and engorged, usually to retain water in arid climates or soil conditions. It is a characteristic that is not used scientifically for the definition of most families and genera of plants because it often can be used as an accurate characteristic only at the single species level. The word succulent comes from the Latin word sucus, meaning juice, or sap', 
    ),
    Product(
      image: '5.png',
      title: 'Dragon Plant',
      desc:
          'Dracaena marginata, more commonly known as a dragon tree, is an attractive plant with green sword-like, red-edged leaves. Native to Madagascar, the eye-catching spiky tree is known as a great entry plant for household gardeners—its easy to care for, drought-tolerant, and nearly indestructible. The slow-growing plant can be planted year-round and boasts tiny white flowers in the spring (though it rarely flowers indoors). This small tree will grow to about 20 feet in warm outdoor climates, but it is generally grown as a potted houseplant and kept pruned to 6 feet or less. Keep the dragon tree away from pets because its toxic to animals if ingested',
    ),
    Product(
      image: '6.png',
      title: 'Ravenea Plant',
      desc:
          'Majesty palm (Ravenea rivularis) is an indoor tree with long arching green fronds atop multiple stems. It is usually grown as a large houseplant, though it can reach heights of up to 90 feet in its native outdoor environment. As a houseplant, it resembles a kentia palm when young and a royal palm when mature. This is high praise since these are two of the more attractive of all indoor palms. When grown indoors, majesty palm is a slow-growing plant, adding no more than 1 foot per year until it reaches about 10 feet in height.',
    ),
    Product(
      image: '2.png',
      title: 'Potted Plant',
      desc:
          'A houseplant is a plant that is grown indoors in places such as residences and offices, mainly for decorative purposes, but studies have also shown them to have positive psychological effects. They also help with indoor air purification, since some species, and the soil-dwelling microbes associated with them, reduce indoor air pollution by absorbing volatile organic compounds including benzene, formaldehyde, and trichloroethylene. While generally toxic to humans, such pollutants are absorbed by the plant and its soil-dwelling microbes without harm.',
    ),
    Product(
      image: '4.png',
      title: 'Ficus elastica',
      desc:
          'Ficus elastica, the rubber fig, rubber bush, rubber tree, rubber plant, or Indian rubber bush, Indian rubber tree, is a species of flowering plant in the family Moraceae, native to eastern parts of South Asia and southeast Asia. It has become naturalized in Sri Lanka, the West Indies, and the US State of Florida',
    ),
    Product(
      image: '3.png',
      title: 'Spider Plant',
      desc:
          'Chlorophytum comosum, usually called spider plant but also known as spider ivy, ribbon plant (a name it shares with Dracaena sanderiana), and hen and chickens is a species of evergreen perennial flowering plant. It is native to tropical and southern Africa, but has become naturalized in other parts of the world, including western Australia. Chlorophytum comosum is easy to grow as a houseplant; variegated forms are the most popular',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 14, right: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                        )
              ),
              
              const Text(
                'Ensiklopedia Tumbuhan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _categoryItem(title: 'POPULAR', isActived: true),
              _categoryItem(title: 'ORGANIC'),
              _categoryItem(title: 'INDOORS'),
              _categoryItem(title: 'SYNTHETIC'),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              physics: BouncingScrollPhysics(),
              crossAxisCount: 4,
              itemCount: _product.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          product: _product[index],
                        ),
                      ),
                    );
                  },
                  child: _productItem(
                    title: _product[index].title,
                    image: _product[index].image,
                  ),
                );
              },
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget _sortButton() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: RotatedBox(
        quarterTurns: 45,
        child: Icon(
          Icons.tune,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _categoryItem({bool isActived = false, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(
              color: isActived ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          height: 4,
          width: 35,
          decoration: isActived
              ? BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                )
              : BoxDecoration(),
        )
      ],
    );
  }

  Widget _productItem(
      {required String title, image }) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/$image',
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(6),
        
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '$title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            ],
          ),
        ],
      ),
    );
  }
}

class Product {
  String title;
  String image;
  String desc;

  Product(
      {required this.title,
      required this.image,
      required this.desc});
}
