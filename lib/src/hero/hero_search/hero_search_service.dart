import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'package:tour_of_heroes/src/hero/hero.dart';

class HeroSearchService {

  final Client _http;

  HeroSearchService(this._http);

  Future<List<Hero>> search(String term) async {
    try {
      final response = await _http.get('api/heroes/?name=$term');
      return (_extractData(response) as List)
        .map((json) => Hero.fromJson(json))
        .toList();
    } catch(e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response response) => json.decode(response.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

}