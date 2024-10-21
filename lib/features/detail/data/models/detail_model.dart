import '../../../../core/core.dart';
import '../../domain/domain.dart';
import 'models.dart';

class DetailModel extends DetailEntity {
  const DetailModel({
    required super.title,
    required super.posterPath,
    required super.overview,
    required super.releaseDate,
    required super.genres,
    required super.voteAverage,
  });

  factory DetailModel.fromJson(Json json) => DetailModel(
        title: json['title'],
        posterPath: json['poster_path'] ?? '',
        overview: json['overview'],
        releaseDate: json['release_date'],
        genres: List<GenreEntity>.from(
          json['genres'].map(
            (dynamic x) => GenreModel.fromJson(x),
          ),
        ),
        voteAverage: json['vote_average'],
      );
}
