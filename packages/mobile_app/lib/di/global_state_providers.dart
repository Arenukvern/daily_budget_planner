import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/monthly/monthly_notifier.dart';
import 'package:mobile_app/ui_home/weekly/weekly_notifier.dart';

class GlobalStateProviders extends StatelessWidget {
  const GlobalStateProviders({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(final BuildContext context) {
    const g = Di.get;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PredictionConfigResource>.value(value: g()),
        ChangeNotifierProvider<OneTimeSumsResource>.value(value: g()),
        ChangeNotifierProvider<TotalSumResource>.value(value: g()),
        ChangeNotifierProvider<DailyBudgetResource>.value(value: g()),
        ChangeNotifierProvider<TasksResource>.value(value: g()),
        ChangeNotifierProvider<TasksTransactionsResource>.value(value: g()),
        ChangeNotifierProvider<BudgetsResource>.value(value: g()),
        ChangeNotifierProvider<RecentBudgetResource>.value(value: g()),
        ChangeNotifierProvider<UiTimelineNotifier>.value(value: g()),
        ChangeNotifierProvider<TasksNotifier>.value(value: g()),
        ChangeNotifierProvider<UserNotifier>.value(value: g()),
        ChangeNotifierProvider<UiLocaleNotifier>.value(value: g()),
        ChangeNotifierProvider<AppStatusResource>.value(value: g()),
        ChangeNotifierProvider<AppSettingsNotifier>.value(value: g()),
        ChangeNotifierProvider<FinSettingsNotifier>.value(value: g()),
        ChangeNotifierProvider<SubscriptionManager>.value(value: g()),
        ChangeNotifierProvider<WeeklyNotifier>.value(value: g()),
        ChangeNotifierProvider<MonthlyNotifier>.value(value: g()),
        ChangeNotifierProvider<MonetizationStatusNotifier>.value(value: g()),
        Provider<AnalyticsManager>.value(value: g()),
        Provider<AnalyticsService>.value(value: g()),
        Provider<PurchaseInitializer>.value(value: g()),
        ChangeNotifierProvider<StoreReviewRequester>.value(value: g()),
      ],
      child: builder(context),
    );
  }
}
