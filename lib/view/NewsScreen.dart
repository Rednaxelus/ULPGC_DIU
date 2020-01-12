import 'package:flutter/material.dart';
import 'package:uni/controler/NewsManager.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen(this._newsManager);

  final NewsManager _newsManager;

  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildLabList(),
      ),
    );
  }

  Widget _buildLabList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        child: returnCardOrDate(context, index),
      ),
      itemCount: widget._newsManager.getNewsLength(),
    );
  }

  Widget returnCardOrDate(BuildContext context, int index) {
    if (index == 0 || !_isPrevNewsDateEqual(index)) {
      TextStyle textStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget._newsManager.getDateOfNews(index),
              style: textStyle,
            ),
          ),
          _buildCard(context, index)
        ],
      );
    }
    return _buildCard(context, index);
  }

  Card _buildCard(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Theme
                .of(context)
                .primaryColor,
            width: 2.0,
          )),
      child: ListTile(
        title: Text(widget._newsManager.getTitleOfNews(index)),
        trailing: Text(
          widget._newsManager.determineIfNewsNew(index),
          style: TextStyle(color: Theme
              .of(context)
              .accentColor),
        ),
        onTap: () {},
      ),
    );
  }

  bool _isPrevNewsDateEqual(int index) {
    return widget._newsManager.getDateOfNews(index - 1) ==
        widget._newsManager.getDateOfNews(index);
  }
}
