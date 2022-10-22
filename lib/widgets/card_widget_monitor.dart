import 'package:marketplace_exercise/models/book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_exercise/models/book.dart';
import 'package:marketplace_exercise/models/monitor.dart';

// ignore: must_be_immutable
class CardWidgetMonitor extends StatefulWidget {
  Monitor monitor;

  CardWidgetMonitor({
    Key? key,
    required this.monitor,
  }) : super(key: key);

  @override
  _CardWidgetMonitorState createState() => _CardWidgetMonitorState();
}

class _CardWidgetMonitorState extends State<CardWidgetMonitor> {
  bool addedToCart = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.all(10),
        width: size.width / 2.5,
        child: Column(children: [
          InkWell(
              onTap: () {},
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.monitor.imageUrl)),
                      borderRadius: BorderRadius.circular(5)),
                  width: size.width / 2.5,
                  height: size.width / 2)),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.5, vertical: 1.5),
                    decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(50)),
                    margin: const EdgeInsets.only(left: 2.5),
                    alignment: Alignment.centerLeft,
                    child: Text("€" + widget.monitor.price.toStringAsFixed(2),
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w500))),
                Expanded(child: Container()),
                InkWell(
                    onTap: () {
                      setState(() {
                        addedToCart = true;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(right: 2.5),
                        child: Icon(Icons.add_shopping_cart_outlined,
                            size: 16,
                            color: addedToCart ? Colors.orange : Colors.black)))
              ])),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(widget.monitor.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700, fontSize: 14)))),
          ]),
        ]));
  }
}
