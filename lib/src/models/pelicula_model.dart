class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  int vodeCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLenguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Pelicula(
      {this.vodeCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLenguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate});

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    vodeCount = json['vode_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLenguage = json['original_lenguage'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date})'];
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'http://via.placeholder.com/350x150';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
