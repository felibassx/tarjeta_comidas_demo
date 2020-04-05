import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  List<String> subtitles = ["1", "4", "3"]; // er lugar de la mesa

  List<Widget> menu() {
    List<Widget> menuList = new List();

    for (int i = 0; i < 3; i++) {
      var menuItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Container(
          height: 350,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                child: Image.asset(
                  images[i],
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
                      backgroundImage:
                          NetworkImage("https://i.pravatar.cc/400"),
                      radius: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        users[i],
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
                  status[i] == "like" ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 245.0,
                left: 30.0,
                child: Text(
                  uppertitles[i],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Positioned(
                top: 270.0,
                left: 30.0,
                child: Text(                  
                  titles[i],
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
                  subtitles[i] + " lugar en el ranking",
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

      menuList.add(menuItem);
    }

    return menuList;
  }

  @override
  Widget build(BuildContext context) {

    Size sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Listado de Comidas',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(44, 44, 44, 1.0),
                          fontSize: 36),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: Color.fromRGBO(242, 82, 27, 1.0),
                    )
                  ],
                ),
              ),
              SizedBox(
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
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(242, 82, 27, 1.0),
            child: Icon(Icons.add_photo_alternate, color: Colors.white),
            onPressed: () {}),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              IconButton(
                  icon: Icon(Icons.fastfood),
                  color: Color.fromRGBO(44, 44, 44, 1.0),
                  onPressed: () {}),
              SizedBox(
                width: 65,
              ),
              IconButton(
                  icon: Icon(Icons.book),
                  color: Color.fromRGBO(44, 44, 44, 1.0),
                  onPressed: () {}),
              SizedBox(
                width: 65,
              ),
              IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Color.fromRGBO(44, 44, 44, 1.0),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  
  }
}
