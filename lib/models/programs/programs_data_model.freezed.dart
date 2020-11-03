// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'programs_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProgramsDataModelTearOff {
  const _$ProgramsDataModelTearOff();

// ignore: unused_element
  _ProgramsDataModel call(
      {String error = "",
      List<ProgramItem> programs,
      bool success = true,
      @nullable int nextPage = 1}) {
    return _ProgramsDataModel(
      error: error,
      programs: programs,
      success: success,
      nextPage: nextPage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProgramsDataModel = _$ProgramsDataModelTearOff();

/// @nodoc
mixin _$ProgramsDataModel {
  String get error;
  List<ProgramItem> get programs;
  bool get success;
  @nullable
  int get nextPage;

  $ProgramsDataModelCopyWith<ProgramsDataModel> get copyWith;
}

/// @nodoc
abstract class $ProgramsDataModelCopyWith<$Res> {
  factory $ProgramsDataModelCopyWith(
          ProgramsDataModel value, $Res Function(ProgramsDataModel) then) =
      _$ProgramsDataModelCopyWithImpl<$Res>;
  $Res call(
      {String error,
      List<ProgramItem> programs,
      bool success,
      @nullable int nextPage});
}

/// @nodoc
class _$ProgramsDataModelCopyWithImpl<$Res>
    implements $ProgramsDataModelCopyWith<$Res> {
  _$ProgramsDataModelCopyWithImpl(this._value, this._then);

  final ProgramsDataModel _value;
  // ignore: unused_field
  final $Res Function(ProgramsDataModel) _then;

  @override
  $Res call({
    Object error = freezed,
    Object programs = freezed,
    Object success = freezed,
    Object nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      programs:
          programs == freezed ? _value.programs : programs as List<ProgramItem>,
      success: success == freezed ? _value.success : success as bool,
      nextPage: nextPage == freezed ? _value.nextPage : nextPage as int,
    ));
  }
}

/// @nodoc
abstract class _$ProgramsDataModelCopyWith<$Res>
    implements $ProgramsDataModelCopyWith<$Res> {
  factory _$ProgramsDataModelCopyWith(
          _ProgramsDataModel value, $Res Function(_ProgramsDataModel) then) =
      __$ProgramsDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      List<ProgramItem> programs,
      bool success,
      @nullable int nextPage});
}

/// @nodoc
class __$ProgramsDataModelCopyWithImpl<$Res>
    extends _$ProgramsDataModelCopyWithImpl<$Res>
    implements _$ProgramsDataModelCopyWith<$Res> {
  __$ProgramsDataModelCopyWithImpl(
      _ProgramsDataModel _value, $Res Function(_ProgramsDataModel) _then)
      : super(_value, (v) => _then(v as _ProgramsDataModel));

  @override
  _ProgramsDataModel get _value => super._value as _ProgramsDataModel;

  @override
  $Res call({
    Object error = freezed,
    Object programs = freezed,
    Object success = freezed,
    Object nextPage = freezed,
  }) {
    return _then(_ProgramsDataModel(
      error: error == freezed ? _value.error : error as String,
      programs:
          programs == freezed ? _value.programs : programs as List<ProgramItem>,
      success: success == freezed ? _value.success : success as bool,
      nextPage: nextPage == freezed ? _value.nextPage : nextPage as int,
    ));
  }
}

/// @nodoc
class _$_ProgramsDataModel extends _ProgramsDataModel {
  const _$_ProgramsDataModel(
      {this.error = "",
      this.programs,
      this.success = true,
      @nullable this.nextPage = 1})
      : assert(error != null),
        assert(success != null),
        super._();

  @JsonKey(defaultValue: "")
  @override
  final String error;
  @override
  final List<ProgramItem> programs;
  @JsonKey(defaultValue: true)
  @override
  final bool success;
  @JsonKey(defaultValue: 1)
  @override
  @nullable
  final int nextPage;

  @override
  String toString() {
    return 'ProgramsDataModel(error: $error, programs: $programs, success: $success, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProgramsDataModel &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.programs, programs) ||
                const DeepCollectionEquality()
                    .equals(other.programs, programs)) &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.nextPage, nextPage) ||
                const DeepCollectionEquality()
                    .equals(other.nextPage, nextPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(programs) ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(nextPage);

  @override
  _$ProgramsDataModelCopyWith<_ProgramsDataModel> get copyWith =>
      __$ProgramsDataModelCopyWithImpl<_ProgramsDataModel>(this, _$identity);
}

abstract class _ProgramsDataModel extends ProgramsDataModel {
  const _ProgramsDataModel._() : super._();
  const factory _ProgramsDataModel(
      {String error,
      List<ProgramItem> programs,
      bool success,
      @nullable int nextPage}) = _$_ProgramsDataModel;

  @override
  String get error;
  @override
  List<ProgramItem> get programs;
  @override
  bool get success;
  @override
  @nullable
  int get nextPage;
  @override
  _$ProgramsDataModelCopyWith<_ProgramsDataModel> get copyWith;
}
