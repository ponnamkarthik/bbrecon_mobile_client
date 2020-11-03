// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'domains_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DomainsDataModelTearOff {
  const _$DomainsDataModelTearOff();

// ignore: unused_element
  _DomainsDataModel call(
      {String error = "",
      List<DomainItem> domains,
      bool success = true,
      bool loading = false,
      @nullable int nextPage = 0}) {
    return _DomainsDataModel(
      error: error,
      domains: domains,
      success: success,
      loading: loading,
      nextPage: nextPage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DomainsDataModel = _$DomainsDataModelTearOff();

/// @nodoc
mixin _$DomainsDataModel {
  String get error;
  List<DomainItem> get domains;
  bool get success;
  bool get loading;
  @nullable
  int get nextPage;

  $DomainsDataModelCopyWith<DomainsDataModel> get copyWith;
}

/// @nodoc
abstract class $DomainsDataModelCopyWith<$Res> {
  factory $DomainsDataModelCopyWith(
          DomainsDataModel value, $Res Function(DomainsDataModel) then) =
      _$DomainsDataModelCopyWithImpl<$Res>;
  $Res call(
      {String error,
      List<DomainItem> domains,
      bool success,
      bool loading,
      @nullable int nextPage});
}

/// @nodoc
class _$DomainsDataModelCopyWithImpl<$Res>
    implements $DomainsDataModelCopyWith<$Res> {
  _$DomainsDataModelCopyWithImpl(this._value, this._then);

  final DomainsDataModel _value;
  // ignore: unused_field
  final $Res Function(DomainsDataModel) _then;

  @override
  $Res call({
    Object error = freezed,
    Object domains = freezed,
    Object success = freezed,
    Object loading = freezed,
    Object nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      domains:
          domains == freezed ? _value.domains : domains as List<DomainItem>,
      success: success == freezed ? _value.success : success as bool,
      loading: loading == freezed ? _value.loading : loading as bool,
      nextPage: nextPage == freezed ? _value.nextPage : nextPage as int,
    ));
  }
}

/// @nodoc
abstract class _$DomainsDataModelCopyWith<$Res>
    implements $DomainsDataModelCopyWith<$Res> {
  factory _$DomainsDataModelCopyWith(
          _DomainsDataModel value, $Res Function(_DomainsDataModel) then) =
      __$DomainsDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      List<DomainItem> domains,
      bool success,
      bool loading,
      @nullable int nextPage});
}

/// @nodoc
class __$DomainsDataModelCopyWithImpl<$Res>
    extends _$DomainsDataModelCopyWithImpl<$Res>
    implements _$DomainsDataModelCopyWith<$Res> {
  __$DomainsDataModelCopyWithImpl(
      _DomainsDataModel _value, $Res Function(_DomainsDataModel) _then)
      : super(_value, (v) => _then(v as _DomainsDataModel));

  @override
  _DomainsDataModel get _value => super._value as _DomainsDataModel;

  @override
  $Res call({
    Object error = freezed,
    Object domains = freezed,
    Object success = freezed,
    Object loading = freezed,
    Object nextPage = freezed,
  }) {
    return _then(_DomainsDataModel(
      error: error == freezed ? _value.error : error as String,
      domains:
          domains == freezed ? _value.domains : domains as List<DomainItem>,
      success: success == freezed ? _value.success : success as bool,
      loading: loading == freezed ? _value.loading : loading as bool,
      nextPage: nextPage == freezed ? _value.nextPage : nextPage as int,
    ));
  }
}

/// @nodoc
class _$_DomainsDataModel extends _DomainsDataModel {
  const _$_DomainsDataModel(
      {this.error = "",
      this.domains,
      this.success = true,
      this.loading = false,
      @nullable this.nextPage = 0})
      : assert(error != null),
        assert(success != null),
        assert(loading != null),
        super._();

  @JsonKey(defaultValue: "")
  @override
  final String error;
  @override
  final List<DomainItem> domains;
  @JsonKey(defaultValue: true)
  @override
  final bool success;
  @JsonKey(defaultValue: false)
  @override
  final bool loading;
  @JsonKey(defaultValue: 0)
  @override
  @nullable
  final int nextPage;

  @override
  String toString() {
    return 'DomainsDataModel(error: $error, domains: $domains, success: $success, loading: $loading, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DomainsDataModel &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.domains, domains) ||
                const DeepCollectionEquality()
                    .equals(other.domains, domains)) &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.nextPage, nextPage) ||
                const DeepCollectionEquality()
                    .equals(other.nextPage, nextPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(domains) ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(nextPage);

  @override
  _$DomainsDataModelCopyWith<_DomainsDataModel> get copyWith =>
      __$DomainsDataModelCopyWithImpl<_DomainsDataModel>(this, _$identity);
}

abstract class _DomainsDataModel extends DomainsDataModel {
  const _DomainsDataModel._() : super._();
  const factory _DomainsDataModel(
      {String error,
      List<DomainItem> domains,
      bool success,
      bool loading,
      @nullable int nextPage}) = _$_DomainsDataModel;

  @override
  String get error;
  @override
  List<DomainItem> get domains;
  @override
  bool get success;
  @override
  bool get loading;
  @override
  @nullable
  int get nextPage;
  @override
  _$DomainsDataModelCopyWith<_DomainsDataModel> get copyWith;
}
