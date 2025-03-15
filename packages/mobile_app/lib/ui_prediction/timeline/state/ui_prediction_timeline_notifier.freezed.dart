// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_prediction_timeline_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UiTimelineState {
  UiPresentationType get presentationType;
  int get selectedIndex;
  List<DateTime> get availableDates;
  bool get isLoading;

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UiTimelineStateCopyWith<UiTimelineState> get copyWith =>
      _$UiTimelineStateCopyWithImpl<UiTimelineState>(
          this as UiTimelineState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UiTimelineState &&
            (identical(other.presentationType, presentationType) ||
                other.presentationType == presentationType) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            const DeepCollectionEquality()
                .equals(other.availableDates, availableDates) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, presentationType, selectedIndex,
      const DeepCollectionEquality().hash(availableDates), isLoading);

  @override
  String toString() {
    return 'UiTimelineState(presentationType: $presentationType, selectedIndex: $selectedIndex, availableDates: $availableDates, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class $UiTimelineStateCopyWith<$Res> {
  factory $UiTimelineStateCopyWith(
          UiTimelineState value, $Res Function(UiTimelineState) _then) =
      _$UiTimelineStateCopyWithImpl;
  @useResult
  $Res call(
      {UiPresentationType presentationType,
      int selectedIndex,
      List<DateTime> availableDates,
      bool isLoading});
}

/// @nodoc
class _$UiTimelineStateCopyWithImpl<$Res>
    implements $UiTimelineStateCopyWith<$Res> {
  _$UiTimelineStateCopyWithImpl(this._self, this._then);

  final UiTimelineState _self;
  final $Res Function(UiTimelineState) _then;

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presentationType = null,
    Object? selectedIndex = null,
    Object? availableDates = null,
    Object? isLoading = null,
  }) {
    return _then(_self.copyWith(
      presentationType: null == presentationType
          ? _self.presentationType
          : presentationType // ignore: cast_nullable_to_non_nullable
              as UiPresentationType,
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      availableDates: null == availableDates
          ? _self.availableDates
          : availableDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _UiTimelineState implements UiTimelineState {
  _UiTimelineState(
      {required this.presentationType,
      required this.selectedIndex,
      required final List<DateTime> availableDates,
      this.isLoading = true})
      : _availableDates = availableDates;

  @override
  final UiPresentationType presentationType;
  @override
  final int selectedIndex;
  final List<DateTime> _availableDates;
  @override
  List<DateTime> get availableDates {
    if (_availableDates is EqualUnmodifiableListView) return _availableDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableDates);
  }

  @override
  @JsonKey()
  final bool isLoading;

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UiTimelineStateCopyWith<_UiTimelineState> get copyWith =>
      __$UiTimelineStateCopyWithImpl<_UiTimelineState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UiTimelineState &&
            (identical(other.presentationType, presentationType) ||
                other.presentationType == presentationType) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            const DeepCollectionEquality()
                .equals(other._availableDates, _availableDates) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, presentationType, selectedIndex,
      const DeepCollectionEquality().hash(_availableDates), isLoading);

  @override
  String toString() {
    return 'UiTimelineState(presentationType: $presentationType, selectedIndex: $selectedIndex, availableDates: $availableDates, isLoading: $isLoading)';
  }
}

/// @nodoc
abstract mixin class _$UiTimelineStateCopyWith<$Res>
    implements $UiTimelineStateCopyWith<$Res> {
  factory _$UiTimelineStateCopyWith(
          _UiTimelineState value, $Res Function(_UiTimelineState) _then) =
      __$UiTimelineStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UiPresentationType presentationType,
      int selectedIndex,
      List<DateTime> availableDates,
      bool isLoading});
}

/// @nodoc
class __$UiTimelineStateCopyWithImpl<$Res>
    implements _$UiTimelineStateCopyWith<$Res> {
  __$UiTimelineStateCopyWithImpl(this._self, this._then);

  final _UiTimelineState _self;
  final $Res Function(_UiTimelineState) _then;

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? presentationType = null,
    Object? selectedIndex = null,
    Object? availableDates = null,
    Object? isLoading = null,
  }) {
    return _then(_UiTimelineState(
      presentationType: null == presentationType
          ? _self.presentationType
          : presentationType // ignore: cast_nullable_to_non_nullable
              as UiPresentationType,
      selectedIndex: null == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      availableDates: null == availableDates
          ? _self._availableDates
          : availableDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
