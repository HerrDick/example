import 'package:example/example.dart' as example;
import 'package:dio/dio.dart';

void main(List<String> arguments) async {
  var url = 'http://dummyjson.com/products';
  Dio client = Dio();
  var responce = await client.get(url);

  Map<String, dynamic> data = responce.data;
  List<dynamic> products = data["products"];

  print("products: ");
  for (dynamic p in products) {
    print(p["title"]);
  }

  var sum = 0.0, count = 0.0, rez=0.0;
  for (dynamic p in products) {
    var rating = p["rating"];
    sum += rating;
    count++;
  }
  rez = sum / count;
  String roundrez = rez.toStringAsFixed(2);
  print("average rating: $roundrez");
}
