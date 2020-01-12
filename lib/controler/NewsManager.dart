import 'package:uni/model/NewsModel.dart';

class NewsManager {
  final List<NewsModel> _news = List<NewsModel>();

  NewsManager() {
    _news.add(NewsModel(
        "UI en Unity3D – Uso práctico avanzado de implementación de UI",
        " Complementa los conocimientos básicos de Unity con el objetivo de experimentar con los diferentes tipos de interfaces de diferentes videojuegos o aplicaciones. Interfaces multidispositivo que un programador profesional debe saber cómoimplementar cuando recibe un diseño de UI/UX durante el desarrollo de cualquier tipo de software. Dirigido a: Usuario básico de Unity3D, que conozca los principios básicos del software y que sepa programar de forma básica utilizando C# en Unity, ya que utilizaremos algunos scripts para crear interfaces dinámicas. Se adaptará a perfiles desde profesionales audiovisuales, diseñadores y programadores que quieran ahondar en las posibilidades de Unity3D como a estudiantes de videojuegos que quieran ampliar sus conocimientos e incluso a usuarios que experimenten con Unity3D como hobby. No es necesario portatil."));
    _news.add(NewsModel(
        "Oferta de trabajo para la tienda virtual de Jugueterias Nikki",
        "Tenemos una oferta de trabajo para la tienda virtual de Jugueterias Nikki. Más detalles en nuestra web"));
  }

  int determineHowManyNewsNew() {
    int counter = 0;
    for (NewsModel news in _news) {
      if (!news.read) counter++;
    }

    return counter;
  }

  String displayNewNewsNotification() {
    int amount = determineHowManyNewsNew();

    if (amount == 0) return "0";

    return " (" + amount.toString() + ")";
  }

  String determineIfNewsNew(int index) {
    if (_news[index].read) return "";
    return "nuevo";
  }

  String getTitleOfNews(int index) {
    return _news[index].title;
  }

  int getNewsLength() {
    return _news.length;
  }
}
