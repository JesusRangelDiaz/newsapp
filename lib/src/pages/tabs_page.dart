import 'package:flutter/material.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (i)=>print('index es: $i'),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Encabezados'),
    ]);
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.green),
      ],
    );
  }
}

class _NavegacioModel with ChangeNotifier{
  int _paginaActual = 0;
  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    notifyListeners();
  }
}