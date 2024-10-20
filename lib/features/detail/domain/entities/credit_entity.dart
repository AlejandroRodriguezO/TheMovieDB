import 'package:equatable/equatable.dart';

class CreditEntity extends Equatable {
  const CreditEntity({
    required this.name,
    required this.profilePath,
    required this.character,
  });

  final String name;
  final String profilePath;
  final String character;

  @override
  List<Object?> get props => <Object?>[
        name,
        profilePath,
        character,
      ];
}
