enum UiPresentationType { day, month, year }

class UiPredictionTimelineParams {
  const UiPredictionTimelineParams({
    this.enableMouseControls = true,
    this.showArrowButtons = true,
    this.enableMouseWheelScroll = false,
  });
  final bool enableMouseControls;
  final bool showArrowButtons;
  final bool enableMouseWheelScroll;
}
