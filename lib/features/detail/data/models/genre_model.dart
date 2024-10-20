import '../../../../core/core.dart';
import '../../domain/domain.dart';

class GenreModel extends GenreEntity {
  const GenreModel({
    required super.name,
  });

  factory GenreModel.fromJson(Json json) => GenreModel(
        name: json['name'],
      );
}
