part of 'theme_bloc.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState.light() = Light;
  const factory ThemeState.dark() = Dark;
}
