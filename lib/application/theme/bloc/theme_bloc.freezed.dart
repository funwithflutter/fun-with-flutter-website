// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ThemeEventTearOff {
  const _$ThemeEventTearOff();

  SwitchTheme switchTheme() {
    return const SwitchTheme();
  }
}

// ignore: unused_element
const $ThemeEvent = _$ThemeEventTearOff();

mixin _$ThemeEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result switchTheme(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result switchTheme(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result switchTheme(SwitchTheme value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result switchTheme(SwitchTheme value),
    @required Result orElse(),
  });
}

abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res>;
}

class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  final ThemeEvent _value;
  // ignore: unused_field
  final $Res Function(ThemeEvent) _then;
}

abstract class $SwitchThemeCopyWith<$Res> {
  factory $SwitchThemeCopyWith(
          SwitchTheme value, $Res Function(SwitchTheme) then) =
      _$SwitchThemeCopyWithImpl<$Res>;
}

class _$SwitchThemeCopyWithImpl<$Res> extends _$ThemeEventCopyWithImpl<$Res>
    implements $SwitchThemeCopyWith<$Res> {
  _$SwitchThemeCopyWithImpl(
      SwitchTheme _value, $Res Function(SwitchTheme) _then)
      : super(_value, (v) => _then(v as SwitchTheme));

  @override
  SwitchTheme get _value => super._value as SwitchTheme;
}

class _$SwitchTheme with DiagnosticableTreeMixin implements SwitchTheme {
  const _$SwitchTheme();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeEvent.switchTheme()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ThemeEvent.switchTheme'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SwitchTheme);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result switchTheme(),
  }) {
    assert(switchTheme != null);
    return switchTheme();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result switchTheme(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (switchTheme != null) {
      return switchTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result switchTheme(SwitchTheme value),
  }) {
    assert(switchTheme != null);
    return switchTheme(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result switchTheme(SwitchTheme value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (switchTheme != null) {
      return switchTheme(this);
    }
    return orElse();
  }
}

abstract class SwitchTheme implements ThemeEvent {
  const factory SwitchTheme() = _$SwitchTheme;
}

class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  Light light() {
    return const Light();
  }

  Dark dark() {
    return const Dark();
  }
}

// ignore: unused_element
const $ThemeState = _$ThemeStateTearOff();

mixin _$ThemeState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result light(),
    @required Result dark(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result light(),
    Result dark(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result light(Light value),
    @required Result dark(Dark value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result light(Light value),
    Result dark(Dark value),
    @required Result orElse(),
  });
}

abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
}

class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;
}

abstract class $LightCopyWith<$Res> {
  factory $LightCopyWith(Light value, $Res Function(Light) then) =
      _$LightCopyWithImpl<$Res>;
}

class _$LightCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements $LightCopyWith<$Res> {
  _$LightCopyWithImpl(Light _value, $Res Function(Light) _then)
      : super(_value, (v) => _then(v as Light));

  @override
  Light get _value => super._value as Light;
}

class _$Light with DiagnosticableTreeMixin implements Light {
  const _$Light();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState.light()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ThemeState.light'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Light);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result light(),
    @required Result dark(),
  }) {
    assert(light != null);
    assert(dark != null);
    return light();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result light(),
    Result dark(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (light != null) {
      return light();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result light(Light value),
    @required Result dark(Dark value),
  }) {
    assert(light != null);
    assert(dark != null);
    return light(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result light(Light value),
    Result dark(Dark value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class Light implements ThemeState {
  const factory Light() = _$Light;
}

abstract class $DarkCopyWith<$Res> {
  factory $DarkCopyWith(Dark value, $Res Function(Dark) then) =
      _$DarkCopyWithImpl<$Res>;
}

class _$DarkCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements $DarkCopyWith<$Res> {
  _$DarkCopyWithImpl(Dark _value, $Res Function(Dark) _then)
      : super(_value, (v) => _then(v as Dark));

  @override
  Dark get _value => super._value as Dark;
}

class _$Dark with DiagnosticableTreeMixin implements Dark {
  const _$Dark();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThemeState.dark()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ThemeState.dark'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Dark);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result light(),
    @required Result dark(),
  }) {
    assert(light != null);
    assert(dark != null);
    return dark();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result light(),
    Result dark(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dark != null) {
      return dark();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result light(Light value),
    @required Result dark(Dark value),
  }) {
    assert(light != null);
    assert(dark != null);
    return dark(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result light(Light value),
    Result dark(Dark value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dark != null) {
      return dark(this);
    }
    return orElse();
  }
}

abstract class Dark implements ThemeState {
  const factory Dark() = _$Dark;
}
