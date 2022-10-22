import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text("Cart",
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 7)
                      ]),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/mid/9780/9761/9780976136729.jpg")))),
                      Flexible(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                                "Signs and Symptoms Analysis from a Functional Perspective- 2nd Edition",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text("Quantity: 1",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text("€8.99",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          )
                        ],
                      ))
                    ],
                  ));
            },
          )),
          InkWell(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  width: size.width,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Expanded(
                        child: Container(
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.transparent))),
                    Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: Text("Checkout",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))),
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.white)))
                  ])))
        ],
      ),
    ));
  }
}
