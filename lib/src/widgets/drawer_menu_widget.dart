import 'package:flutter/material.dart';

class DrawerMenuWidget extends StatelessWidget {
  const DrawerMenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _crearDrawerMenu(context);
  }

  Widget _crearDrawerMenu(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          // _createDrawerItem(icon: Icons.map,text: 'Ubicaciones', onTap: () => _menuRedirect(context, 'ubicaciones')),
          // _createDrawerItem(icon: Icons.web,text: 'URL'),
          _createDrawerItem(
              icon: Icons.person,
              text: 'Mi Perfil',
              onTap: () => _menuRedirect(context, 'home', '')),
          _createDrawerItem(
              icon: Icons.fastfood,
              text: 'Mis Recetas',
              onTap: () => _menuRedirect(context, 'myrecipe', '')),
          _createDrawerItem(
              icon: Icons.category,
              text: 'Categorias',
              onTap: () => _menuRedirect(context, 'categories', '')),
          _createDrawerItem(
              icon: Icons.favorite,
              text: 'Favoritos',
              onTap: () => _menuRedirect(context, 'favorite', '')),
          Divider(
            color: Color.fromRGBO(252, 34, 0, 1.0),
            height: 15,
          ),
          _createDrawerItem(
              icon: Icons.create,
              text: 'Crear Receta',
              onTap: () => _menuRedirect(context, 'create', '')),

          // _createDrawerItem(icon: Icons.code, text: 'Generar QR', onTap: () => _menuRedirect(context, 'historiales', 'generaqr')),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Color.fromRGBO(252, 34, 0, 1.0),),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: new BoxDecoration(
          color: Colors.black54,
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: new ExactAssetImage('assets/images/drawerimg.jpg'),
          ),
        ),
        // decoration: BoxDecoration(
        //   color: Color.fromRGBO(0, 0, 0, 0.9),
        //   image: DecorationImage(
        //     image: new ExactAssetImage('assets/images/drawerimg.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Menú Recetario",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold))),
        ]));
  }

  void _menuRedirect(BuildContext context, String routeName, String tipo) {
    Navigator.pushNamed(context, routeName, arguments: tipo);
  }
}
