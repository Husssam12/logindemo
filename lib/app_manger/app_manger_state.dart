part of 'app_manger_bloc.dart';

enum AppState {
  splash,
  authenticated,
  unAuthenticated,
}

@immutable
class AppMangerState {
  final AppState appState;

  const AppMangerState({required this.appState});

  const AppMangerState.initial() : this(appState: AppState.splash);

  AppMangerState copyWith({
    AppState? state,
  }) {
    return AppMangerState(
      appState: state ?? appState,
    );
  }

  @override
  String toString() {
    return {'state': appState.name}.toString();
  }
}
