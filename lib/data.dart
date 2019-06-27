import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String apiKey = '10923b261ba94d897ac6b81148314a3f';
final String apiUrl = "https://api.themoviedb.org/3/movie";

Future<List<Movie>> getMovies() async {
  final response = await http.get('$apiUrl/now_playing?api_key=$apiKey');
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final results = data["results"];
    final List<Movie> movies = [];
    results.forEach((m) {
      final movie = Movie.fromJson(m);
      movies.add(movie);
    });
    return movies;
  } else {
    throw Exception("Can't get movies");
  }
}

class Movie {
  final int id;
  final String title;
  final String releaseDate;
  final String poster;

  Movie({this.id, this.title, this.releaseDate, this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json["id"],
        title: json["title"],
        releaseDate: json["release_date"],
        poster: json['poster_path']);
  }
}
