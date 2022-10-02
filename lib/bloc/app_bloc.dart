import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_demo/bloc/app_event.dart';
import 'package:intro_demo/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<GetConfigurationEvent>(_onGetConfiguration);
  }

  _onGetConfiguration(
      GetConfigurationEvent event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(status: GetConfigurationStatus.progressing));
      await Future.delayed(const Duration(seconds: 10));
      emit(state.copyWith(status: GetConfigurationStatus.success));
      //â
    } catch (err) {
      emit(state.copyWith(status: GetConfigurationStatus.error));
    }
  }
}
