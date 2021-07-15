
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '1c3e08a883cf9f796c3fdb629a240b97';
  String _language = 'es-ES';

  MoviesProvider(){
    print('MovieProvider inicializado');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(this._baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.post(url);
    final Map<String, dynamic> decodedData = json.decode(response.body);
    
    print(decodedData);
  }
}