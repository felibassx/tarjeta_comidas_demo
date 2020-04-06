import 'package:flutter/material.dart';
import 'package:tarjeta_comidas_demo/src/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: Text('data'),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.9),
          title: Text(
            'Recetas Demo',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        body: CardWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: _createActionButton(),
        bottomNavigationBar: _createAppBar(),
      ),
    );
  }

  Widget _createActionButton() {
    return FloatingActionButton(
        backgroundColor: Color.fromRGBO(252, 34, 0, 1.0),
        child: Icon(Icons.add_photo_alternate, color: Colors.white),
        onPressed: () {});
  }

  Widget _createAppBar() {
    return BottomAppBar(
      color: Color.fromRGBO(0, 0, 0, 0.9),
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
              color: Colors.white,
              onPressed: () {}),
          SizedBox(
            width: 65,
          ),
          IconButton(
              icon: Icon(Icons.book), color: Colors.white, onPressed: () {}),
          SizedBox(
            width: 65,
          ),
          IconButton(
              icon: Icon(Icons.favorite_border),
              color: Colors.white,
              onPressed: () {}),
        ],
      ),
    );
  }
}
