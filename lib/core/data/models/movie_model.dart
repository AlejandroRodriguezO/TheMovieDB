import '../../core.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.posterPath,
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.releaseDate,
    super.overview,
  });

  factory MovieModel.fromJson(Json json) => MovieModel(
        posterPath: json['poster_path'] ?? '',
        id: json['id'] ?? 0,
        backdropPath: json['backdrop_path'] ?? '',
        title: json['title'] ?? '',
        voteAverage:
            json['vote_average'] != null ? json['vote_average'] ?? 0 : null,
        releaseDate:
            json['release_date'] != null ? json['release_date'] ?? '' : null,
        overview: json['overview'] != null
            ? json['overview'] ?? 'Sin descripción'
            : null,
      );
}
