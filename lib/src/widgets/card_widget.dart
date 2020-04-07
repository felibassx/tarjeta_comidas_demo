import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  // data de ejemplo
  List<String> images = [
    'assets/images/cazuela.jpg',
    'assets/images/empanadas.jpg',
    'assets/images/humitas.jpg'
  ];

  List<String> users = ["Felibass", "Fluttero", "Dartero"];
  List<String> status = ["unlike", "like", "like"];
  List<String> titles = ["Cazuela Chilena", "Empanadas de Pino", "Humitas"];
  List<String> subtitles = ["Baja", "Alta", "Media"];
  // data de ejemplo

  // Solo a modo de ejemplo, se crea la lista de tarjetas
  List<Widget> menu() {
    List<Widget> menuList = new List();

    for (int i = 0; i < 3; i++) {
      var menuItem = myCard('https://i.pravatar.cc/400', images[i], users[i],
          status[i], titles[i], subtitles[i]);

      menuList.add(menuItem);
    }

    return menuList;
  }

  Widget myCard(String avatarImg, String image, String user, String status,
      String title, String subtitle) {
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
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
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
                'Nombre del plato',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Positioned(
              top: 260.0,
              left: 30.0,
              child: ButtonTheme(
                buttonColor: Colors.transparent,
                child: RaisedButton(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {}),
              ),
            ),
            Positioned(
              top: 305.0,
              left: 30.0,
              child: Text(
                'Dificultad: ' + subtitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
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

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25),
              child: Stack(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 8),
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
          ),
        ],
      ),
    );
  }
}
