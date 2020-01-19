import 'package:intl/intl.dart';
import 'package:uni/model/NewsModel.dart';

class NewsRepository {
  final List<NewsModel> _news = List<NewsModel>();
  static final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  NewsRepository() {
    DateTime dateTime = DateTime.now();

    _news.add(NewsModel("El calendario de examenes ya está actualizado",
        "Puede verlo en la página de web", dateTime));
    _news.add(NewsModel(
        "Elecciones para cubrir vacantes en la Junta de Escuela",
        "ELECCIONES PARA LA COBERTURA DE PUESTOS DE REPRESENTACIÓN VACANTES EN LA JUNTA DE ESCUELA",
        DateTime(2020, 1, 10)));
    _news.add(NewsModel(
        "Oferta de empleo - ASTICAN",
        "Se busca titulado/a informático para realizar Programa Inserta para el departamento de informática/sistemas.",
        DateTime(2020, 1, 9)));
    _news.last.read = true;
    _news.add(NewsModel(
        "Oferta de trabajo para la tienda virtual de Jugueterias Nikki",
        "Tenemos una oferta de trabajo para la tienda virtual de Jugueterias Nikki. Más detalles en nuestra web",
        DateTime(2020, 1, 9)));
    _news.last.read = true;
    _news.add(NewsModel(
        "UI en Unity3D – Uso práctico avanzado de implementación de UI",
        "Complementa los conocimientos básicos de Unity con el objetivo de experimentar con los diferentes tipos de interfaces de diferentes videojuegos o aplicaciones. Interfaces multidispositivo que un programador profesional debe saber cómoimplementar cuando recibe un diseño de UI/UX durante el desarrollo de cualquier tipo de software. Dirigido a: Usuario básico de Unity3D, que conozca los principios básicos del software y que sepa programar de forma básica utilizando C# en Unity, ya que utilizaremos algunos scripts para crear interfaces dinámicas. Se adaptará a perfiles desde profesionales audiovisuales, diseñadores y programadores que quieran ahondar en las posibilidades de Unity3D como a estudiantes de videojuegos que quieran ampliar sus conocimientos e incluso a usuarios que experimenten con Unity3D como hobby. No es necesario portatil.",
        DateTime(2019, 9, 12)));
    _news.last.read = true;
    _news.add(NewsModel("Bienvenido a 'EII para ti'", "Nos alegro verte",
        DateTime(2019, 9, 4)));
    _news.last.read = true;
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

    if (amount == 0) return "";

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

  String getDateOfNews(int index) {
    return _dateFormat.format(_news[index].dateTime);
  }

  String getDescriptionOfNews(int index) {
    return _news[index].description;
  }

  void setReadOfNews(int index, bool param1) {
    _news[index].read = param1;
  }
}
