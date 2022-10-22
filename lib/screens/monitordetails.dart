import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_exercise/models/monitor.dart';
import 'package:marketplace_exercise/screens/cart.dart';

class MonitorDetails extends StatefulWidget {
  Monitor monitor;
  MonitorDetails({Key? key, required this.monitor}) : super(key: key);

  @override
  _MonitorDetailsState createState() => _MonitorDetailsState();
}

class _MonitorDetailsState extends State<MonitorDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Expanded(
              child: ListView(
            children: [
              Stack(children: [
                Container(
                  height: size.width / 1.5,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(widget.monitor.imageUrl))),
                ),
                Positioned(
                    top: 40,
                    left: 15,
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey[100]),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20,
                            )))),
                Positioned(
                    top: 40,
                    right: 15,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (ctx) => Cart()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ))),
                Positioned(
                    top: 50,
                    right: 25,
                    child: Container(
                        height: 13,
                        width: 13,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "0",
                          style: GoogleFonts.poppins(),
                        )))
              ]),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20, top: 20, bottom: 10),
                                    child: Text(widget.monitor.name,
                                        style: GoogleFonts.poppins(
                                            fontSize: 20)))),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "€ " + widget.monitor.price.toStringAsFixed(2),
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.black),
                            )),
                      ])),
              field("Brand", widget.monitor.brand),
              field("Description", widget.monitor.description),
              field(
                  "Refresh Rate", widget.monitor.refreshRate.toString() + 'Hz'),
              field("Special Features",
                  widget.monitor.specialFeatures.toString()),
              field("Resolution", widget.monitor.resolution),
            ],
          )),
          InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed('/Pages');
              },
              child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Text("Add To Cart",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold))))
        ]));
  }

  Widget field(String title, String content) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(fontSize: 18),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      content,
                      style: GoogleFonts.poppins(),
                    ))
              ],
            )),
          ],
        ));
  }
}
