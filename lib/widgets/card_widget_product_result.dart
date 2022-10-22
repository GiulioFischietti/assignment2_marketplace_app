import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_exercise/models/product.dart';

// ignore: must_be_immutable
class CardWidgetProductResult extends StatefulWidget {
  Product product;
  // ProductController _con;
  // final Favorite preferiti;
  CardWidgetProductResult({
    Key? key,
    required this.product,

    /*this.preferiti*/
  }) : super(key: key);

  @override
  _CardWidgetProductResultState createState() =>
      _CardWidgetProductResultState();
}

class _CardWidgetProductResultState extends State<CardWidgetProductResult> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // widget._con = ProductController();
    // widget._con.product = widget.product;
    return Container(
      width: size.width / 2.4,
      height: 190,
      margin: EdgeInsets.all(20),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(
                      widget.product.imageUrl,
                    ),
                    fit: widget.product.imageUnavailable
                        ? BoxFit.cover
                        : BoxFit.contain),
              )),
            )),
            Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                                  child: Text(
                            widget.product.name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400),
                          ))),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  selected = true;
                                });
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, bottom: 5, top: 5),
                                  child: Icon(Icons.add_shopping_cart_outlined,
                                      color: selected
                                          ? Colors.orange
                                          : Colors.black)))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                              child: Text(
                            "€" + widget.product.price.toStringAsFixed(2),
                            style:
                                GoogleFonts.poppins(color: Colors.orange[800]),
                          ))
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
