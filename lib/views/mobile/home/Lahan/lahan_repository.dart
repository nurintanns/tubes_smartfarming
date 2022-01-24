import 'dart:convert';
import 'package:smartfarming/views/mobile/home/Lahan/dataAPI/movie.dart';
import 'package:http/http.dart' as http;

class LahanRepository{
List<Movie> _movies = <Movie>[];

static Future<List<Movie>> fetchMovie(int currentPage) async {
  final response =
      await http.get(Uri.parse('http://agriradar.id/api/web/v1/lahans/get-lahan' ));
  var movies = <Movie>[];
  if (response.statusCode == 200) {
    var moviesJson = json.decode(response.body);
    for (var movieJson in moviesJson['items']) {
      movies.add(Movie.fromJson(movieJson));
    }
  }
  return movies;
}
}