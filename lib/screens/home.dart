import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_exercise/providers/home_provider.dart';
import 'package:marketplace_exercise/providers/user_provider.dart';
import 'package:marketplace_exercise/widgets/Category.dart';
import 'package:marketplace_exercise/widgets/card_widget_beer.dart';
import 'package:marketplace_exercise/widgets/card_widget_book.dart';
import 'package:marketplace_exercise/widgets/card_widget_monitor.dart';
import 'package:marketplace_exercise/widgets/menu_tile_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getBeers();
    homeProvider.getBooks();
    homeProvider.getMonitors();
  }

  List<dynamic> categories = [
    {"color": Color(0xFFEEEEEE), "name": "Beers", "icon": Icons.local_drink},
    {"color": Color(0xFFEEEEEE), "name": "Books", "icon": Icons.menu_book},
    {
      "color": Color(0xFFEEEEEE),
      "name": "Monitors",
      "icon": Icons.computer_rounded
    },
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      return Scaffold(
          // appBar: AppBar(
          //   elevation: 0,
          //   actions: [],
          // ),
          key: _scaffoldKey,
          drawer: Drawer(
            elevation: 0,
            child: Column(
              children: <Widget>[
                DrawerHeader(
                  child: userProvider.user.username != ''
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(
                                    left: 10, top: 30, right: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        userProvider.user.imageUrl,
                                      ),
                                    )),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: 20, top: 30),
                                  child: Text(userProvider.user.username,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.black)))),
                            ])
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(
                                    left: 10, top: 30, right: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        userProvider.user.imageUrl,
                                      ),
                                    )),
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 10, top: 30),
                                  child: FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Accedi",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18,
                                                  color: Colors.black)))))
                            ]),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  height: 10,
                ),
                MenuTileWidget(
                    icon: Icon(Icons.exit_to_app_outlined),
                    label: "Log Out",
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.clear();
                      userProvider.user.username = "";
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }),
                Container(
                  height: 40,
                )
              ],
            ),
          ),
          body: Container(
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, bottom: 0),
                alignment: Alignment.centerLeft,
                child: Text("Home",
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 10, left: 10, right: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [])),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Container(
                      padding: EdgeInsets.all(12.5),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey[300]!, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.5)),
                      child: Row(children: [
                        InkWell(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Container(
                                child:
                                    Icon(Icons.menu, color: Colors.grey[700]))),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Search()));
                                },
                                child: Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Text("Search for a product...",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 14,
                                                fontWeight:
                                                    FontWeight.w400)))))),
                        InkWell(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (ctx) => MapResultsSearch(
                              //         keyword: "",
                              //         position: null,
                              //         categories: [])));
                            },
                            child: Container(
                                child: Icon(Icons.search,
                                    color: Colors.grey[700]))),
                      ]))),
              Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 0, top: 40),
                      child: Text('Categories',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)))),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 130,
                      alignment: Alignment.centerLeft,
                      child: ListView.builder(
                        shrinkWrap: true,

                        scrollDirection: Axis.horizontal,
                        // physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        // gridDelegate:
                        //     SliverGridDelegateWithFixedCrossAxisCount(
                        //         crossAxisCount: 2),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return (CategoryWidget(
                              categoryColor: categories[index]['color'],
                              image: "",
                              icon: categories[index]["icon"],
                              name: categories[index]['name'],
                              description: "",
                              type: ""));
                        },
                      )),
                ],
              ),
              InkWell(
                  onTap: () async {
                    // dynamic pos = await getStoredLocation(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => MapResultsSearch(
                    //         keyword: "", position: pos, categories: [])));
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 40),
                      child: Row(children: [
                        Expanded(
                            child: Container(
                                child: Text('Beers',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400))))),
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Text("Show More",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)))),
                        Icon(Icons.arrow_forward, size: 16)
                      ]))),
              Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 320,
                  child: Consumer<HomeProvider>(
                      builder: (context, homeProvider, _) {
                    return homeProvider.beers.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.beers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return (CardWidgetBeer(
                                  beer: homeProvider.beers[index]));
                            },
                          )
                        : Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                              "Nessuna prodotto",
                              style: GoogleFonts.poppins(),
                            ));
                  })),
              InkWell(
                  onTap: () async {
                    // dynamic pos = await getStoredLocation(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => MapResultsSearch(
                    //         keyword: "", position: pos, categories: [])));
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 40),
                      child: Row(children: [
                        Expanded(
                            child: Container(
                                child: Text('Books',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400))))),
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Text("Show More",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)))),
                        Icon(Icons.arrow_forward, size: 16)
                      ]))),
              Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 320,
                  child: Consumer<HomeProvider>(
                      builder: (context, homeProvider, _) {
                    return homeProvider.books.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.books.length,
                            itemBuilder: (BuildContext context, int index) {
                              return (CardWidgetBook(
                                  book: homeProvider.books[index]));
                            },
                          )
                        : Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                              "Nessuna prodotto",
                              style: GoogleFonts.poppins(),
                            ));
                  })),
              InkWell(
                  onTap: () async {
                    // dynamic pos = await getStoredLocation(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (ctx) => MapResultsSearch(
                    //         keyword: "", position: pos, categories: [])));
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 40),
                      child: Row(children: [
                        Expanded(
                            child: Container(
                                child: Text('Monitors',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400))))),
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Text("Show More",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)))),
                        Icon(Icons.arrow_forward, size: 16)
                      ]))),
              Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 320,
                  child: Consumer<HomeProvider>(
                      builder: (context, homeProvider, _) {
                    return homeProvider.monitors.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeProvider.monitors.length,
                            itemBuilder: (BuildContext context, int index) {
                              return (CardWidgetMonitor(
                                  monitor: homeProvider.monitors[index]));
                            },
                          )
                        : Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                              "Nessun prodotto",
                              style: GoogleFonts.poppins(),
                            ));
                  }))
            ],
          )))));
    });
  }
}
