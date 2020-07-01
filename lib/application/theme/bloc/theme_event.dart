part of 'theme_bloc.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.switchTheme() = SwitchTheme;
  // const factory ThemeEvent.switchToLight() = _SwitchToLight;
}
