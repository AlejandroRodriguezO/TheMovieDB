import 'package:the_movie_db/features/detail/detail.dart';

const DetailEntity movieDetail = DetailEntity(
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  releaseDate: 'releaseDate',
  genres: <GenreEntity>[
    GenreEntity(name: 'name'),
  ],
  voteAverage: 7.3,
);

const DetailModel detailModel = DetailModel(
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  releaseDate: 'releaseDate',
  genres: <GenreEntity>[
    GenreModel(name: 'name'),
  ],
  voteAverage: 7.3,
);
