import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/core.dart';

import '../../../helpers/dummy_data/json_reader.dart';

void main() {
  const MovieModel movieModel = MovieModel(
    posterPath: '/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg',
    id: 268,
    backdropPath: '/2va32apQP97gvUxaMnL5wYt4CRB.jpg',
    title: 'Batman',
    voteAverage: 7.2,
    releaseDate: '1989-06-21',
  );

  test('should be a subclass of movie entity', () async {
    //assert
    expect(movieModel, isA<MovieEntity>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/movie_response.json'),
    );

    //act
    final MovieModel result = MovieModel.fromJson(jsonMap);

    //assert
    expect(result, equals(movieModel));
  });
}
