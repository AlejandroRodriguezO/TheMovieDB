import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;

  @override
  List<Object?> get props => <Object?>[
        posterPath,
        id,
        backdropPath,
        title,
        voteAverage,
        releaseDate,
      ];
}
