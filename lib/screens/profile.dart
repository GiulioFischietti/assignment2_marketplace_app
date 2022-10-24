import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace_exercise/providers/user_provider.dart';
import 'package:marketplace_exercise/screens/edit_profile.dart';
import 'package:marketplace_exercise/screens/orders.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child: Consumer<UserProvider>(builder: (context, userProvider, _) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text("Profile",
                textScaleFactor: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: NetworkImage(userProvider.user.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 0, top: 40),
                      child: Text(
                        userProvider.user.name,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 0),
                      child: Text(
                        "@" + userProvider.user.username,
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ))
                ],
              )
            ],
          ),
          profileTile("Edit Profile", Icons.edit_outlined, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => EditProfile()));
          }),
          profileTile("Orders", Icons.shopping_bag, () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => Orders()));
          }),
          Expanded(child: Container()),
          logOutTile("Log Out", Icons.exit_to_app_outlined, () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            userProvider.user.username = "";
            Navigator.pop(context);
          })
        ],
      );
    })));
  }

  Widget profileTile(String label, IconData icon, Function onTap) {
    return InkWell(
        onTap: () => onTap(),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Icon(icon)),
            Expanded(
              child: Container(
                  // margin: EdgeInsets.all(20),
                  child: Text(label, style: GoogleFonts.poppins(fontSize: 16))),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: Icon(Icons.arrow_forward_ios)),
          ],
        ));
  }

  Widget logOutTile(String label, IconData icon, Function onTap) {
    return InkWell(
        onTap: () => onTap(),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Icon(icon)),
            Expanded(
              child: Container(
                  // margin: EdgeInsets.all(20),
                  child: Text(label, style: GoogleFonts.poppins(fontSize: 16))),
            ),
          ],
        ));
  }
}
