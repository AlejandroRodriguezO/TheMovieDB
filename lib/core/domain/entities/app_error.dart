import 'package:equatable/equatable.dart';

import '../../core.dart';

class AppError extends Equatable {
  const AppError(this.appErrorType);

  final AppErrorEnum appErrorType;

  @override
  List<Object> get props => <Object>[
        appErrorType,
      ];
}
