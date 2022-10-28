import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_exercise/screens/manager/products_by_category.dart';
import 'package:marketplace_exercise/screens/user/cart.dart';
import 'package:marketplace_exercise/screens/user/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomTabContainerManager extends StatefulWidget {
  int initialIndex = 0;
  BottomTabContainerManager({
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  _BottomTabContainerManagerState createState() =>
      _BottomTabContainerManagerState();
}

String name = "";
String image = "";

class _BottomTabContainerManagerState extends State<BottomTabContainerManager> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    // Scaffold(body: NearActivities()),
    Scaffold(body: ProductsByCategory()),
    // Scaffold(body: Cart()),
    Scaffold(body: Profile()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _onItemTapped(widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.grey[100],
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.local_shipping_outlined),
                title: Text('Products',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ))),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.shopping_cart),
              //   title: Text('Cart',
              //       style: GoogleFonts.poppins(
              //           textStyle: const TextStyle(
              //         fontSize: 11,
              //         fontWeight: FontWeight.w400,
              //       ))),
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                title: Text('Profile',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ))),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ));
  }
}
