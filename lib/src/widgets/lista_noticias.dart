import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/darktheme.dart';

class ListaNoticias extends StatelessWidget {
  
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index){
        return _Noticia(noticia: noticias[index], index: index);
      }
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia, index: index),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia),
        _TarjetaBody(noticia  : noticia),
        const SizedBox(height: 10),
        const Divider(),
        _TarjetaBotones(noticia: noticia),
        const SizedBox(height: 10),
        const Divider(),

      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index+1}. ', style: TextStyle(color: myTheme.colorScheme.secondary)),
          Text('${noticia.source.name}. '),
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticia.title, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
    );
    }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (noticia.urlToImage!=null)
        ? FadeInImage(
        placeholder: const AssetImage('assets/img/giphy.gif'), 
        image: NetworkImage(noticia.urlToImage)
      )
      : const Image(image: AssetImage('assets/img/no-image.png')),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description!=null)?noticia.description : ''),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  final Article noticia;

  const _TarjetaBotones({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            fillColor: myTheme.colorScheme.secondary,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          )
        ],
      ),
    );
  }
}