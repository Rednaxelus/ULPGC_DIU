import 'package:flutter/material.dart';
import 'package:uni/controller/NewsRepository.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen(this._newsRepository);

  final NewsRepository _newsRepository;

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
        child: returnCardOrDate(context, index),
      ),
      itemCount: widget._newsRepository.getNewsLength(),
    );
  }

  Widget returnCardOrDate(BuildContext context, int index) {
    if (index == 0 || !_isPrevNewsDateEqual(index)) {
      TextStyle textStyle =
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              widget._newsRepository.getDateOfNews(index),
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
      color: Colors.blueGrey[50],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          )),
      child: ListTile(
        title: Text(widget._newsRepository.getTitleOfNews(index)),
        trailing: Text(
          widget._newsRepository.determineIfNewsNew(index),
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        onTap: () {
          setState(() {
            widget._newsRepository.setReadOfNews(index, true);
          });
          _showDialogOfNews(context, index);
        },
      ),
    );
  }

  bool _isPrevNewsDateEqual(int index) {
    return widget._newsRepository.getDateOfNews(index - 1) ==
        widget._newsRepository.getDateOfNews(index);
  }

  Future _showDialogOfNews(BuildContext context, int index) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        TextStyle _descriptionTextStyle = TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[50]);
        TextStyle _descriptionTextStyle2 = TextStyle(fontSize: 18);
        return SimpleDialog(
          contentPadding: EdgeInsets.all(0),
          backgroundColor: Colors.blueGrey[50],
          shape: new RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor, width: 4),
              borderRadius: new BorderRadius.circular(10.0)),
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color: Theme.of(context).primaryColor,
                borderRadius:
                    new BorderRadius.vertical(top: new Radius.circular(10.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget._newsRepository.getTitleOfNews(index),
                  style: _descriptionTextStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Text(widget._newsRepository.getDescriptionOfNews(index),
                  style: _descriptionTextStyle2),
            ),
          ],
        );
      },
    );
  }
}
