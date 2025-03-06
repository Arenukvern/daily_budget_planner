import 'package:get_it/get_it.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/tasks_local_api.dart';
import 'package:mobile_app/ui_home/monthly/monthly_notifier.dart';
import 'package:mobile_app/ui_home/weekly/weekly_notifier.dart';
import 'package:mobile_app/ui_paywalls/ui_paywalls.dart';

/// Shortcuts
/// Should not be exposed
final _getIt = GetIt.instance;

/// get instance of a service
final _g = _getIt.get;

class Di {
  Di._();
  static const init = _init;
  static const dispose = _dispose;
  static T get<T extends Object>() => _getIt.get<T>();
}

void _dispose() => unawaited(_getIt.reset());

Future<void> _init({required final AnalyticsManager analyticsManager}) async {
  await _getIt.reset();
  final r = _getIt.registerSingleton;
  final rl = _getIt.registerLazySingleton;

  /// ********************************************
  /// *      API
  /// ********************************************
  r<AnalyticsManager>(analyticsManager, dispose: (final i) => i.dispose());
  r<CrashlyticsService>(
    analyticsManager.crashlyticsService,
    dispose: (final i) => i.dispose(),
  );
  r<AnalyticsService>(
    analyticsManager.analyticsService,
    dispose: (final i) => i.dispose(),
  );
  final localDb = PrefsDb();
  final isarDb = IsarDb();

  r<LocalDbI>(localDb);
  r<IsarDb>(isarDb, dispose: (final i) => i.close());
  rl(UserLocalApi.new);
  rl(AppSettingsLocalApi.new);
  rl(SimpleBudgetLocalApi.new);
  rl(ManualBudgetsLocalApi.new);
  rl(DictionariesLocalApi.new);
  rl(FinSettingsLocalApi.new);
  rl(TransactionsLocalApi.new);
  rl(TasksLocalApi.new);

  /// ********************************************
  /// *      RESOURCES
  /// ********************************************
  rl(TasksResource.new, dispose: (final i) => i.dispose());
  rl(TasksTransactionsResource.new, dispose: (final i) => i.dispose());
  rl(BudgetsResource.new, dispose: (final i) => i.dispose());
  rl(RecentBudgetResource.new, dispose: (final i) => i.dispose());
  rl(PredictionConfigResource.new, dispose: (final i) => i.dispose());
  rl(OneTimeSumsResource.new, dispose: (final i) => i.dispose());
  rl(TotalSumResource.new, dispose: (final i) => i.dispose());
  rl(DailyBudgetResource.new, dispose: (final i) => i.dispose());

  /// ********************************************
  /// *      Notifiers
  /// ********************************************
  final localeNotifier = UiLocaleNotifier(Locales.fallback);
  r(localeNotifier, dispose: (final i) => i.dispose());
  rl(AppSettingsNotifier.new, dispose: (final i) => i.dispose());
  rl(UserNotifier.new, dispose: (final i) => i.dispose());
  rl(AppStatusNotifier.new, dispose: (final i) => i.dispose());
  // TODO(arenukvern): create a factory for this
  /// possible conflicts with purchase managers
  rl<PurchaseManager>(
    () => switch (Envs.storeTarget) {
      InstallPlatformTarget.rustore => FlutterRustoreBillingManager(
          consoleApplicationId: Envs.rustoreApplicationId,
          // ignore: avoid_redundant_argument_values
          enableLogger: Envs.logging,
          deeplinkScheme: Envs.appScheme,
          productTypeChecker: MonetizationProducts.productTypeChecker,
        ),
      InstallPlatformTarget.appleStore ||
      InstallPlatformTarget.googlePlay =>
        NoopPurchaseManager(),
      // TODO(arenukvern): description
      // InAppPurchaseManager(),
      _ => NoopPurchaseManager(),
    },
  );
  rl(
    () => UiTimelineNotifier(
      state: UiTimelineState.create(
        presentationType: UiPresentationType.day,
        initialDate: DateTime.now(),
      ),
    ),
    dispose: (final i) => i.dispose(),
  );
  rl(
    () => MonetizationStatusNotifier(Envs.monetizationType),
    dispose: (final i) => i.dispose(),
  );
  rl(DictionariesNotifier.new, dispose: (final i) => i.dispose());
  rl(FinSettingsNotifier.new, dispose: (final i) => i.dispose());
  rl(TasksNotifier.new, dispose: (final i) => i.dispose());
  rl(
    () => SubscriptionManager(
      productIds: MonetizationProducts.subscriptions,
      purchaseManager: _g(),
      monetizationTypeNotifier: _g(),
    ),
    dispose: (final i) => i.dispose(),
  );
  rl(
    () => StoreReviewRequester(
      localDb: localDb,
      getLocale: () => localeNotifier.value,
    ),
    dispose: (final i) => i.dispose(),
  );
  rl(
    () => PurchaseInitializer(
      monetizationTypeNotifier: _g(),
      purchaseManager: _g(),
      subscriptionManager: _g(),
    ),
    dispose: (final i) => i.dispose(),
  );
  rl(WeeklyNotifier.new, dispose: (final i) => i.dispose());
  rl(MonthlyNotifier.new, dispose: (final i) => i.dispose());
}

mixin HasLocalApis {
  LocalDbI get localDb => _g();
  AppSettingsLocalApi get appSettingsApi => _g();
  UserLocalApi get userLocalApi => _g();
  FinSettingsLocalApi get finSettingsLocalApi => _g();

  SimpleBudgetLocalApi get simpleBudgetLocalApi => _g();
  ManualBudgetsLocalApi get manualBudgetsLocalApi => _g();

  DictionariesLocalApi get dictionariesLocalApi => _g();
  TransactionsLocalApi get transactionsLocalApi => _g();
  ScheduledTransactionsLocalApi get scheduledTransactionsLocalApi => _g();
  TasksLocalApi get tasksLocalApi => _g();
}

/// Resources cannot access any Notifiers directly.
/// They have simple mission - to distribute and store runtime data
/// for ui access.
mixin HasResources {
  TasksResource get tasksResource => _g();
  TasksTransactionsResource get tasksTransactionsResource => _g();
  BudgetsResource get budgetsResource => _g();
  RecentBudgetResource get recentBudgetResource => _g();
  PredictionConfigResource get predictionConfigResource => _g();
  OneTimeSumsResource get oneTimeSumsResource => _g();
  TotalSumResource get totalSumResource => _g();
  DailyBudgetResource get dailyBudgetResource => _g();
}

/// These states should not be used in each other,
/// but they can access Distributors via [HasResources]
///
/// States can and should have business logic, but should minimize
/// state usage to make ui management more effective.
mixin HasNotifiers {
  UserNotifier get userNotifier => _g();
  AppStatusNotifier get appStatusNotifier => _g();
  UiLocaleNotifier get localeNotifier => _g();
  AppSettingsNotifier get appSettingsNotifier => _g();
  PurchaseInitializer get purchaseIntializer => _g();
  SubscriptionManager get subscriptionManager => _g();
  WeeklyNotifier get weeklyCubit => _g();
  MonthlyNotifier get monthlyCubit => _g();
  StoreReviewRequester get storeReviewRequester => _g();
  DictionariesNotifier get dictionariesNotifier => _g();
  TasksNotifier get tasksNotifier => _g();
  FinSettingsNotifier get finSettingsNotifier => _g();
  UiTimelineNotifier get uiTimelineNotifier => _g();
}

mixin HasAnalytics {
  AnalyticsManager get analyticsManager => _g();
  AnalyticsService get analyticsService => _g();
  CrashlyticsService get crashlyticsService => _g();
}

mixin HasComplexLocalDbs {
  IsarDb get isarDb => _g();
}
