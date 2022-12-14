import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplace_exercise/models/beer.dart';
import 'package:marketplace_exercise/providers/manager_provider.dart';
import 'package:marketplace_exercise/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class CreateBeer extends StatefulWidget {
  CreateBeer({Key? key}) : super(key: key);

  @override
  _CreateBeerState createState() => _CreateBeerState();
}

String nameInitialValue = "";
String shortDescriptionInitialValue = "";
String descriptionInitialValue = "";
String alcoholInitialValue = "";
String volumeInitialValue = "";
String priceInitialValue = "";
String stockInitialValue = "";

class _CreateBeerState extends State<CreateBeer> {
  XFile? _image;
  Beer beer = new Beer({});
  _imgFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 30);

    setState(() {
      _image = image!;
    });
    // widget.con.editPropic(file: File(image.path));
  }

  _imgFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
    // widget.con.editPropic(file: File(image.path));
  }

  TextEditingController name_controller =
      TextEditingController(text: nameInitialValue);
  TextEditingController short_description_controller =
      TextEditingController(text: shortDescriptionInitialValue);
  TextEditingController description_controller =
      TextEditingController(text: descriptionInitialValue);
  TextEditingController price_controller =
      TextEditingController(text: priceInitialValue);
  TextEditingController volume_controller =
      TextEditingController(text: volumeInitialValue);
  TextEditingController alcohol_controller =
      TextEditingController(text: alcoholInitialValue);
  TextEditingController stock_controller =
      TextEditingController(text: stockInitialValue);
  TextEditingController brand_controller =
      TextEditingController(text: stockInitialValue);

  bool popup = false;
  bool notifications = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black)),
          backgroundColor: Colors.grey[100],
          title: Text("Create Beer",
              style: GoogleFonts.poppins(
                  color: Colors.black, fontWeight: FontWeight.w500)),
        ),
        body: Column(children: [
          Expanded(
              child: ListView(shrinkWrap: true, children: [
            Container(
                color: Colors.white,
                // padding: EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext bc) {
                                return SafeArea(
                                  child: Container(
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                            leading: Icon(Icons.photo_library),
                                            title: Text('Galleria'),
                                            onTap: () {
                                              _imgFromGallery();
                                              Navigator.of(context).pop();
                                            }),
                                        ListTile(
                                          leading: Icon(Icons.photo_camera),
                                          title: Text('Fotocamera'),
                                          onTap: () {
                                            _imgFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                            height: size.width / 2,
                            width: size.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    // image: _image != null
                                    //     ? FileImage(File(_image.path))
                                    // :
                                    image: NetworkImage(beer.imageUrl),
                                    fit: BoxFit.contain)))),
                  ],
                )),
            Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400]!.withOpacity(0.1),
                      blurRadius: 7,
                      offset: Offset(10, 10),
                      spreadRadius: 3)
                ]),
                padding: EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child: Text("Name", style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) => beer.name = value,
                            controller: name_controller,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child: Text("Brand", style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) => beer.brand = value,
                            controller: brand_controller,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child: Text("Short Description",
                              style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) => beer.shortDescription = value,
                            controller: short_description_controller,
                            minLines: 1,
                            maxLines: 3,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child: Text("Description",
                              style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) => beer.description = value,
                            minLines: 3,
                            maxLines: 3,
                            controller: description_controller,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child: Text("Price ???", style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) =>
                                beer.price = double.parse(value),
                            controller: price_controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child: Text("Volume in mL",
                              style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) =>
                                beer.volumeMl = int.parse(value),
                            keyboardType: TextInputType.number,
                            controller: volume_controller,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child:
                              Text("Alcohol %", style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) =>
                                beer.alcoholPercentage = double.parse(value),
                            keyboardType: TextInputType.number,
                            controller: alcohol_controller,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 30),
                          child: Text("Stock", style: GoogleFonts.poppins())),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                            onChanged: (value) => beer.stock = int.parse(value),
                            keyboardType: TextInputType.number,
                            controller: stock_controller,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[300]!,
                                ),
                              ),
                            ),
                            style: GoogleFonts.poppins()),
                      ),
                    ])),
          ])),
          InkWell(
              onTap: () async {
                final managerProvider =
                    Provider.of<ManagerProvider>(context, listen: false);
                managerProvider.createBeer(beer);
                Navigator.of(context).pop();
              },
              child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Text("Add Product",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold))))
        ]));
  }
}
