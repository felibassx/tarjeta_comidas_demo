import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // data de ejemplo
  List<String> images = [
    'assets/images/casuela.jpg',
    'assets/images/empanadas.jpg',
    'assets/images/humitas.jpg'
  ];

  List<String> users = ["Felibass", "Fluttero", "Dartero"];
  List<String> status = ["unlike", "like", "like"];
  List<String> uppertitles = [
    "9 Abril, 11:30 AM",
    "10 Abril, 1:00 PM",
    "13 Abril, 1:00 PM"
  ];
  List<String> titles = ["Casuela Chilena", "Empanadas de Pino", "Humitas"];
  List<String> subtitles = [
    "1er lugar en el ranking",
    "4to lugar en el ranking",
    "3er lugar en el ranking"
  ];
  // data de ejemplo

  List<Widget> menu() {
    List<Widget> menuList = new List();

    for (int i = 0; i < 3; i++) {
      var menuItem = myCard('https://i.pravatar.cc/400', images[i], users[i],
          status[i], uppertitles[i], titles[i], subtitles[i]);

      menuList.add(menuItem);
    }

    return menuList;
  }

  Widget myCard(String avatarImg, String image, String user, String status,
      String uppertitle, String title, String subtitle) {
        
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Container(
        height: 350,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.transparent),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
              child: new DecoratedBox(
                  decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topCenter,
                    colors: [Colors.black87, Colors.transparent]),
              )),
            ),
            Positioned(
              top: 30.0,
              left: 30.0,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarImg),
                    radius: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      user,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 30.0,
              right: 30.0,
              child: Icon(
                status == "like" ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 245.0,
              left: 30.0,
              child: Text(
                uppertitle,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Positioned(
              top: 270.0,
              left: 30.0,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 305.0,
              left: 30.0,
              child: Text(
                subtitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.of(context).size;

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, right: 25),
        child: Stack(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 25, left: 25),
                child: Container(
                  height: sizeScreen.height * 0.80,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: menu(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
