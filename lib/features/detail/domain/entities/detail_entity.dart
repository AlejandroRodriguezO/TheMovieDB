import 'package:equatable/equatable.dart';

import 'entities.dart';

class DetailEntity extends Equatable {
  const DetailEntity({
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.genres,
    required this.voteAverage,
  });

  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final List<GenreEntity> genres;
  final num voteAverage;

  @override
  List<Object?> get props => <Object?>[
        title,
        posterPath,
        overview,
        releaseDate,
        genres,
        voteAverage,
      ];
}
