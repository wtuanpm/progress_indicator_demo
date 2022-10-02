import 'package:equatable/equatable.dart';

enum GetConfigurationStatus { empty, progressing, success, error }

class AppState extends Equatable {
  final GetConfigurationStatus status;

  const AppState({this.status = GetConfigurationStatus.empty});

  AppState copyWith({GetConfigurationStatus? status}) =>
      AppState(status: status ?? this.status);

  @override
  List<Object?> get props => [status];
}
