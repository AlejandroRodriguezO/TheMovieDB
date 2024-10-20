import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  const GenreEntity({
    required this.name,
  });

  final String name;

  @override
  List<Object?> get props => <Object?>[
        name,
      ];
}
