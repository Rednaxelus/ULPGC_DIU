import 'package:flutter/material.dart';
import 'package:uni/model/NewsModel.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen();

  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> _news;

  @override
  void initState() {
    super.initState();
    _news = [];
    _news.add(News(
        "Tenemos una oferta de trabajo para la tienda virtual de Jugueterias Nikki. Más detalles en nuestra web"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text('Calendario'),
      // ),
      body: SafeArea(
        child: _buildLabList(),
      ),
    );
  }

  Widget _buildLabList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        child: Card(
          child: ListTile(
            title: Text(_news[index].name),
            onTap: () {},
          ),
        ),
      ),
      itemCount: _news.length,
    );
  }
}
