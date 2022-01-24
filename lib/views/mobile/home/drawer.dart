import 'package:flutter/material.dart';
import 'package:swiggy_ui/views/mobile/home/Beranda/home_slider.dart';
import 'package:swiggy_ui/views/mobile/home/Beranda/homepage.dart';
import 'package:swiggy_ui/views/mobile/home/login_view.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
               /* image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('assets/images/tealogo.png')
              ),*/
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Beranda'),
            onTap: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return HomePageLahan();
            }))},
          ),
          ListTile(
            leading: Icon(Icons.landscape),
            title: Text("Lahan"),
            onTap: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return HomeSlider();
            }))},
          ),
       /*   ListTile(
            leading: Icon(Icons.settings),
            title: Text("Pengaturan"),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
           leading: Icon(Icons.person),
            title: Text('Akun'),
            onTap: () => {Navigator.of(context).pop()},
          ),*/
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Keluar'),
            onTap: () => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return LoginPage();
            }))},
          ),
        ],
      ),
    );

  }
}
