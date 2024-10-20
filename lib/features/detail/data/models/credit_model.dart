import '../../../../core/core.dart';
import '../../domain/domain.dart';

class CreditModel extends CreditEntity {
  const CreditModel({
    required super.name,
    required super.profilePath,
    required super.character,
  });

  factory CreditModel.fromJson(Json json) => CreditModel(
        name: json['name'],
        profilePath: json['profile_path'] ?? '',
        character: json['character'],
      );
}
