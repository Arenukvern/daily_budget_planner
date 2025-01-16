import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';

part 'ui_prediction_timeline_notifier.freezed.dart';

// Date Generation Strategy
class DateGenerationStrategy {
  DateGenerationStrategy._();
  static List<DateTime> generateDates({
    required final UiPresentationType presentationType,
    required final DateTime initialDate,
  }) {
    final now = DateTime.now();
    return switch (presentationType) {
      UiPresentationType.day => List.generate(
          10000,
          (final index) => now.subtract(Duration(days: 5000 - index)),
        ),
      // TODO(arenukvern): verify behaviour later
      UiPresentationType.month => List.generate(
          10000,
          (final index) => DateTime(now.year, now.month - (5000 - index)),
        ),
      // TODO(arenukvern): verify behaviour later
      UiPresentationType.year => List.generate(
          10000,
          (final index) => DateTime(now.year - (5000 - index)),
        ),
    };
  }
}

@freezed
class UiTimelineState with _$UiTimelineState {
  factory UiTimelineState({
    required final UiPresentationType presentationType,
    required final int selectedIndex,
    required final List<DateTime> availableDates,
    @Default(true) final bool isLoading,
  }) = _UiTimelineState;

  factory UiTimelineState.create({
    required final UiPresentationType presentationType,
    required final DateTime initialDate,
  }) {
    final availableDates = DateGenerationStrategy.generateDates(
      presentationType: presentationType,
      initialDate: initialDate,
    );
    return UiTimelineState(
      presentationType: presentationType,
      selectedIndex: getIndexByDate(
        availableDates: availableDates,
        date: initialDate,
        presentationType: presentationType,
      ),
      availableDates: availableDates,
    );
  }

  static int getIndexByDate({
    required final DateTime date,
    required final UiPresentationType presentationType,
    required final List<DateTime> availableDates,
  }) =>
      availableDates.indexWhere(
        (final availableDate) => switch (presentationType) {
          UiPresentationType.day => availableDate.year == date.year &&
              availableDate.month == date.month &&
              availableDate.day == date.day,
          UiPresentationType.month => availableDate.year == date.year &&
              availableDate.month == date.month,
          UiPresentationType.year => availableDate.year == date.year,
        },
      );
}

// Reusable Timeline Notifier
class UiTimelineNotifier extends ValueNotifier<UiTimelineState> {
  UiTimelineNotifier({
    required final UiTimelineState state,
  }) : super(state);

  void scrollToCurrentDate(final PageController pageController) {
    final now = DateTime.now();
    final currentDateIndex = UiTimelineState.getIndexByDate(
      date: now,
      presentationType: value.presentationType,
      availableDates: value.availableDates,
    );

    if (currentDateIndex >= 0) {
      unawaited(
        pageController.animateToPage(
          currentDateIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  UiPresentationType get presentationType => value.presentationType;
  set presentationType(final UiPresentationType type) =>
      value = value.copyWith(presentationType: type);
  DateTime get currentDate => value.availableDates[value.selectedIndex];
  int get selectedIndex => value.selectedIndex;
  set selectedIndex(final int index) =>
      value = value.copyWith(selectedIndex: index);

  bool get isLoading => value.isLoading;
  set isLoading(final bool loading) =>
      value = value.copyWith(isLoading: loading);
}
