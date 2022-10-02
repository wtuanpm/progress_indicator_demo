import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {}

class GetConfigurationEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}
