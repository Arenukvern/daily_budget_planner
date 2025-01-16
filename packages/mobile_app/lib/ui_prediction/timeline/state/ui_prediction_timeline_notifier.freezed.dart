// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_prediction_timeline_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UiTimelineState {
  UiPresentationType get presentationType => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  List<DateTime> get availableDates => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UiTimelineStateCopyWith<UiTimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiTimelineStateCopyWith<$Res> {
  factory $UiTimelineStateCopyWith(
          UiTimelineState value, $Res Function(UiTimelineState) then) =
      _$UiTimelineStateCopyWithImpl<$Res, UiTimelineState>;
  @useResult
  $Res call(
      {UiPresentationType presentationType,
      int selectedIndex,
      List<DateTime> availableDates,
      bool isLoading});
}

/// @nodoc
class _$UiTimelineStateCopyWithImpl<$Res, $Val extends UiTimelineState>
    implements $UiTimelineStateCopyWith<$Res> {
  _$UiTimelineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presentationType = freezed,
    Object? selectedIndex = null,
    Object? availableDates = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      presentationType: freezed == presentationType
          ? _value.presentationType
          : presentationType // ignore: cast_nullable_to_non_nullable
              as UiPresentationType,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      availableDates: null == availableDates
          ? _value.availableDates
          : availableDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiTimelineStateImplCopyWith<$Res>
    implements $UiTimelineStateCopyWith<$Res> {
  factory _$$UiTimelineStateImplCopyWith(_$UiTimelineStateImpl value,
          $Res Function(_$UiTimelineStateImpl) then) =
      __$$UiTimelineStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UiPresentationType presentationType,
      int selectedIndex,
      List<DateTime> availableDates,
      bool isLoading});
}

/// @nodoc
class __$$UiTimelineStateImplCopyWithImpl<$Res>
    extends _$UiTimelineStateCopyWithImpl<$Res, _$UiTimelineStateImpl>
    implements _$$UiTimelineStateImplCopyWith<$Res> {
  __$$UiTimelineStateImplCopyWithImpl(
      _$UiTimelineStateImpl _value, $Res Function(_$UiTimelineStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presentationType = freezed,
    Object? selectedIndex = null,
    Object? availableDates = null,
    Object? isLoading = null,
  }) {
    return _then(_$UiTimelineStateImpl(
      presentationType: freezed == presentationType
          ? _value.presentationType
          : presentationType // ignore: cast_nullable_to_non_nullable
              as UiPresentationType,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      availableDates: null == availableDates
          ? _value._availableDates
          : availableDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UiTimelineStateImpl implements _UiTimelineState {
  _$UiTimelineStateImpl(
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

  @override
  String toString() {
    return 'UiTimelineState(presentationType: $presentationType, selectedIndex: $selectedIndex, availableDates: $availableDates, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiTimelineStateImpl &&
            const DeepCollectionEquality()
                .equals(other.presentationType, presentationType) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            const DeepCollectionEquality()
                .equals(other._availableDates, _availableDates) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(presentationType),
      selectedIndex,
      const DeepCollectionEquality().hash(_availableDates),
      isLoading);

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiTimelineStateImplCopyWith<_$UiTimelineStateImpl> get copyWith =>
      __$$UiTimelineStateImplCopyWithImpl<_$UiTimelineStateImpl>(
          this, _$identity);
}

abstract class _UiTimelineState implements UiTimelineState {
  factory _UiTimelineState(
      {required final UiPresentationType presentationType,
      required final int selectedIndex,
      required final List<DateTime> availableDates,
      final bool isLoading}) = _$UiTimelineStateImpl;

  @override
  UiPresentationType get presentationType;
  @override
  int get selectedIndex;
  @override
  List<DateTime> get availableDates;
  @override
  bool get isLoading;

  /// Create a copy of UiTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiTimelineStateImplCopyWith<_$UiTimelineStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
