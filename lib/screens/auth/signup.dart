import 'package:marketplace_exercise/providers/constants.dart';
import 'package:marketplace_exercise/screens/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:marketplace_exercise/screens/user/bottomtabcontainer.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController surnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController pwdRepeatController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();

  var _privacyprofilazione = false;
  var _privacyofferte = false;
  bool _errorNameVisible = false;
  bool _errorSurnameVisible = false;
  bool _errorEmailVisible = false;
  bool _errorPwdVisible = false;
  bool _errorPhoneVisible = false;

  Future<void> signUp() async {
    final response = await http.post(Uri.parse(host + '/registration'), body: {
      "email": emailController.text.replaceAll(" ", ""),
      "password": pwdController.text,
      "name": nameController.text,
      'surname': surnameController.text,
      "phone": phoneNumberController.text
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var loginResponse = json.decode(response.body);
      if (!loginResponse['error']) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Attiva l'account"),
                content: new Text(loginResponse['message']),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Chiudi"),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                      Navigator.pop(
                        context,
                      );
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => Login()));
                    },
                  ),
                ],
              );
            });
      } else {
        final prefs = await SharedPreferences.getInstance();
        //print(loginResponse['api_token']);
        prefs.setString('api_token', loginResponse['api_token']);
        prefs.setString('email', emailController.text);
        prefs.setString('password', pwdController.text);
        //print(prefs.getString('api_token'));

        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Attiva l'account"),
                content: new Text(
                    "Ti è stata inviata una email di conferma con i passi da seguire per attivare l'account"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Chiudi"),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                ],
              );
            });
      }
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Colors.grey[100],
            height: size.height,
            width: double.infinity,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 0),
                    alignment: Alignment.center,
                    child: Text("MarketPlace",
                        textScaleFactor: 1,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Text("Crea un account",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(fontSize: 16, color: Colors.black))),
                  ),
                  _errorNameVisible
                      ? Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Nome non valido",
                            style: TextStyle(color: Colors.red[600]),
                          ))
                      : Container(),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Container(
                        child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: nameController,
                            autocorrect: false,
                            style: TextStyle(color: Colors.grey[800]),
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.grey[800]),
                              labelStyle: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(color: Colors.grey[800])),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor: Colors.grey[600],
                              hoverColor: Colors.grey[600],
                              labelText: 'Nome',
                            )),
                      )),

                  _errorPhoneVisible
                      ? Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Campo vuoto",
                            style: TextStyle(color: Colors.red[600]),
                          ))
                      : Container(),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Container(
                        child: TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            style: TextStyle(color: Colors.grey[800]),
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.phone, color: Colors.grey[800]),
                              labelStyle: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(color: Colors.grey[800])),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor: Colors.grey[800],
                              hoverColor: Colors.grey[800],
                              labelText: 'Numero di telefono',
                            )),
                      )),
                  _errorEmailVisible
                      ? Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Email non valida",
                            style: TextStyle(color: Colors.red[600]),
                          ))
                      : Container(),

                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 10, right: 20, left: 20, top: 10),
                      child: Container(
                        child: TextFormField(
                            controller: emailController,
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.grey[800]),
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.grey[800]),
                              labelStyle: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(color: Colors.grey[800])),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor: Colors.grey[800],
                              hoverColor: Colors.grey[800],
                              labelText: 'Email',
                            )),
                      )),

                  _errorPwdVisible
                      ? Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Le due password non coincidono/sono vuote, riprova",
                            style: TextStyle(color: Colors.red[600]),
                          ))
                      : Container(),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 15, right: 20, left: 20, top: 10),
                      child: Container(
                        child: TextFormField(
                            obscureText: true,
                            controller: pwdController,
                            autocorrect: false,
                            style: TextStyle(color: Colors.grey[800]),
                            decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.grey[800]),
                              labelStyle: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(color: Colors.grey[800])),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: _errorPwdVisible
                                        ? Colors.red[600]!
                                        : Colors.transparent,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor: Colors.grey[800],
                              hoverColor: Colors.grey[800],
                              labelText: 'Password',
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 5, top: 5),
                      child: Container(
                        child: TextFormField(
                            controller: pwdRepeatController,
                            autocorrect: false,
                            style: TextStyle(color: Colors.grey[800]),
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon:
                                  Icon(Icons.lock, color: Colors.grey[800]),
                              labelStyle: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(color: Colors.grey[800])),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: _errorPwdVisible
                                        ? Colors.red[600]!
                                        : Colors.transparent,
                                    width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusColor: Colors.grey[800],
                              hoverColor: Colors.grey[800],
                              labelText: 'Ripeti Password',
                            )),
                      )),
                  // CheckboxListTile(
                  //     title: Text(
                  //         "Acconsento all'utilizzo dei miei dati personali",
                  //         style: TextStyle(color: Colors.grey[600])),
                  //     value: _privacyprofilazione,
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     onChanged: (bool value) {
                  //       setState(() {
                  //         _privacyprofilazione = value;
                  //       });
                  //     }),
                  // CheckboxListTile(
                  //     title: Text(
                  //         "Acconsento all'utilizzo dei miei dati personali a fini commerciali",
                  //         style: TextStyle(color: Colors.grey[600])),
                  //     value: _privacyofferte,
                  //     controlAffinity: ListTileControlAffinity.leading,
                  //     onChanged: (bool value) {
                  //       setState(() {
                  //         _privacyofferte = value;
                  //       });
                  //     }),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 20),
                    child: FlatButton(
                      onPressed: () async {
                        if (nameController.text == '' ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(emailController.text) ||
                            surnameController.text == '' ||
                            phoneNumberController.text == '' ||
                            (pwdController.text != pwdRepeatController.text)) {
                          if (nameController.text == '') {
                            setState(() {
                              _errorNameVisible = true;
                            });
                          } else {
                            setState(() {
                              _errorNameVisible = false;
                            });
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(emailController.text)) {
                            setState(() {
                              _errorEmailVisible = true;
                            });
                          } else {
                            setState(() {
                              _errorEmailVisible = false;
                            });
                          }
                          if (phoneNumberController.text == '') {
                            setState(() {
                              _errorPhoneVisible = true;
                            });
                          } else {
                            setState(() {
                              _errorPhoneVisible = false;
                            });
                          }

                          if (surnameController.text == '') {
                            setState(() {
                              _errorSurnameVisible = true;
                            });
                          } else {
                            setState(() {
                              _errorSurnameVisible = false;
                            });
                          }

                          if ((pwdController.text !=
                                  pwdRepeatController.text) ||
                              pwdController.text == '' ||
                              pwdRepeatController.text == '') {
                            setState(() {
                              _errorPwdVisible = true;
                            });
                          } else {
                            setState(() {
                              _errorPwdVisible = false;
                            });
                          }
                        } else {
                          signUp();
                        }
                      },
                      color: Colors.orange[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Registrati",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ]))));
  }
}
