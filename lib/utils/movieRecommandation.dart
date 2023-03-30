import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieRecommandation {
  static Future<List<dynamic>> getDepressionMovies() async {
    final apiKey = '83694bc97ca533d778a18a44a5776c01';
    final query = 'depression';

    final uri = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query');

    final response = await http.get(uri);


    if (response.statusCode == 200) {
      // Decode the JSON response
      var jsonData = jsonDecode(response.body);
      // print(jsonData);
      return jsonData['results'];

      // Access the movie data
      // final results = jsonData['results'];
      // final movieTitle = results[0]['title'];
      // final moviePoster = 'https://image.tmdb.org/t/p/w500' + results[0]['poster_path'];
  
    } else {
      print('Error ${response.statusCode}');
      return [];
    }
  }
}

