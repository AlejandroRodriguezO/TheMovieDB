part of 'detail_movie_cubit.dart';

class DetailMovieState extends Equatable {
  const DetailMovieState({
    this.detailState = const DetailInitial(),
    this.creditState = const CreditInitial(),
  });

  final DetailState detailState;
  final CreditState creditState;

  @override
  List<Object> get props => <Object>[
        detailState,
        creditState,
      ];

  DetailMovieState copyWith({
    DetailState? detailState,
    CreditState? creditState,
  }) {
    return DetailMovieState(
      detailState: detailState ?? this.detailState,
      creditState: creditState ?? this.creditState,
    );
  }
}

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => <Object>[];
}

final class DetailInitial extends DetailState {
  const DetailInitial();
}

final class DetailLoading extends DetailState {
  const DetailLoading();
}

final class DetailLoaded extends DetailState {
  const DetailLoaded({required this.movie});
  final DetailEntity movie;
}

final class DetailFailed extends DetailState {
  const DetailFailed({required this.error});
  final AppError error;
}

sealed class CreditState extends Equatable {
  const CreditState();

  @override
  List<Object> get props => <Object>[];
}

final class CreditInitial extends CreditState {
  const CreditInitial();
}

final class CreditLoading extends CreditState {
  const CreditLoading();
}

final class CreditLoaded extends CreditState {
  const CreditLoaded({required this.credit});
  final List<CreditEntity> credit;
}

final class CreditFailed extends CreditState {
  const CreditFailed({required this.error});
  final AppError error;
}
