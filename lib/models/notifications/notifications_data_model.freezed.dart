// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'notifications_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationsDataModelTearOff {
  const _$NotificationsDataModelTearOff();

// ignore: unused_element
  _NotificationsDataModel call(
      {String error = "",
      List<NotificationItem> notifications,
      bool success = true,
      bool loading = false,
      @nullable int nextPage = 1}) {
    return _NotificationsDataModel(
      error: error,
      notifications: notifications,
      success: success,
      loading: loading,
      nextPage: nextPage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationsDataModel = _$NotificationsDataModelTearOff();

/// @nodoc
mixin _$NotificationsDataModel {
  String get error;
  List<NotificationItem> get notifications;
  bool get success;
  bool get loading;
  @nullable
  int get nextPage;

  $NotificationsDataModelCopyWith<NotificationsDataModel> get copyWith;
}

/// @nodoc
abstract class $NotificationsDataModelCopyWith<$Res> {
  factory $NotificationsDataModelCopyWith(NotificationsDataModel value,
          $Res Function(NotificationsDataModel) then) =
      _$NotificationsDataModelCopyWithImpl<$Res>;
  $Res call(
      {String error,
      List<NotificationItem> notifications,
      bool success,
      bool loading,
      @nullable int nextPage});
}

/// @nodoc
class _$NotificationsDataModelCopyWithImpl<$Res>
    implements $NotificationsDataModelCopyWith<$Res> {
  _$NotificationsDataModelCopyWithImpl(this._value, this._then);

  final NotificationsDataModel _value;
  // ignore: unused_field
  final $Res Function(NotificationsDataModel) _then;

  @override
  $Res call({
    Object error = freezed,
    Object notifications = freezed,
    Object success = freezed,
    Object loading = freezed,
    Object nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed ? _value.error : error as String,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications as List<NotificationItem>,
      success: success == freezed ? _value.success : success as bool,
      loading: loading == freezed ? _value.loading : loading as bool,
      nextPage: nextPage == freezed ? _value.nextPage : nextPage as int,
    ));
  }
}

/// @nodoc
abstract class _$NotificationsDataModelCopyWith<$Res>
    implements $NotificationsDataModelCopyWith<$Res> {
  factory _$NotificationsDataModelCopyWith(_NotificationsDataModel value,
          $Res Function(_NotificationsDataModel) then) =
      __$NotificationsDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      List<NotificationItem> notifications,
      bool success,
      bool loading,
      @nullable int nextPage});
}

/// @nodoc
class __$NotificationsDataModelCopyWithImpl<$Res>
    extends _$NotificationsDataModelCopyWithImpl<$Res>
    implements _$NotificationsDataModelCopyWith<$Res> {
  __$NotificationsDataModelCopyWithImpl(_NotificationsDataModel _value,
      $Res Function(_NotificationsDataModel) _then)
      : super(_value, (v) => _then(v as _NotificationsDataModel));

  @override
  _NotificationsDataModel get _value => super._value as _NotificationsDataModel;

  @override
  $Res call({
    Object error = freezed,
    Object notifications = freezed,
    Object success = freezed,
    Object loading = freezed,
    Object nextPage = freezed,
  }) {
    return _then(_NotificationsDataModel(
      error: error == freezed ? _value.error : error as String,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications as List<NotificationItem>,
      success: success == freezed ? _value.success : success as bool,
      loading: loading == freezed ? _value.loading : loading as bool,
      nextPage: nextPage == freezed ? _value.nextPage : nextPage as int,
    ));
  }
}

/// @nodoc
class _$_NotificationsDataModel extends _NotificationsDataModel {
  const _$_NotificationsDataModel(
      {this.error = "",
      this.notifications,
      this.success = true,
      this.loading = false,
      @nullable this.nextPage = 1})
      : assert(error != null),
        assert(success != null),
        assert(loading != null),
        super._();

  @JsonKey(defaultValue: "")
  @override
  final String error;
  @override
  final List<NotificationItem> notifications;
  @JsonKey(defaultValue: true)
  @override
  final bool success;
  @JsonKey(defaultValue: false)
  @override
  final bool loading;
  @JsonKey(defaultValue: 1)
  @override
  @nullable
  final int nextPage;

  @override
  String toString() {
    return 'NotificationsDataModel(error: $error, notifications: $notifications, success: $success, loading: $loading, nextPage: $nextPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationsDataModel &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.notifications, notifications) ||
                const DeepCollectionEquality()
                    .equals(other.notifications, notifications)) &&
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
      const DeepCollectionEquality().hash(notifications) ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(nextPage);

  @override
  _$NotificationsDataModelCopyWith<_NotificationsDataModel> get copyWith =>
      __$NotificationsDataModelCopyWithImpl<_NotificationsDataModel>(
          this, _$identity);
}

abstract class _NotificationsDataModel extends NotificationsDataModel {
  const _NotificationsDataModel._() : super._();
  const factory _NotificationsDataModel(
      {String error,
      List<NotificationItem> notifications,
      bool success,
      bool loading,
      @nullable int nextPage}) = _$_NotificationsDataModel;

  @override
  String get error;
  @override
  List<NotificationItem> get notifications;
  @override
  bool get success;
  @override
  bool get loading;
  @override
  @nullable
  int get nextPage;
  @override
  _$NotificationsDataModelCopyWith<_NotificationsDataModel> get copyWith;
}
