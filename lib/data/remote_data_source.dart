import 'dart:convert';
import 'package:coctails/data/coctails_responce/coctails/coctails.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RemoteDataSource {
  final http.Client client = Client();

  Future<Coctails> getData() async {
    final response = await client.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a'));
    if (response.statusCode == 200) {
      var documents = json.decode(response.body);

      return Coctails.fromJson(documents);
    } else {
      throw Exception();
    }
  }
}
