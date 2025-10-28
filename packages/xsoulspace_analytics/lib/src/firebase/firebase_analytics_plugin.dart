import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:from_json_to_json/from_json_to_json.dart';
import 'package:universal_io/io.dart';

import '../interfaces/interfaces.dart';
import '../models/models.dart';

class FirebaseAnalyticsPlugin implements AnalyticsService {
  FirebaseAnalyticsPlugin({this.forceAnalytics = false});
  final bool forceAnalytics;
  late final FirebaseAnalytics _analytics;
  bool _isEnabled = false;

  @override
  Future<void> onLoad() async {
    final isAllowed =
        forceAnalytics || (!(Platform.isLinux || Platform.isWindows));
    _isEnabled = isAllowed;
    if (!isAllowed) return;
    _analytics = FirebaseAnalytics.instance;
    _isEnabled = await _analytics.isSupported();
    if (_isEnabled) {
      await _analytics.logAppOpen();
    }
  }

  @override
  Future<void> logEvent(final AnalyticsEvent event) async {
    if (!_isEnabled) return;
    final parameters = <String, Object>{
      for (final entry in (event.parameters ?? {}).entries)
        entry.key: entry.value,
    };
    switch (event.name) {
      case AnalyticsEvents.kScreenView:
        await _analytics.logScreenView(
          screenName:
              parameters[AnalyticsEvents.kScreenViewScreenName] as String?,
          parameters: parameters,
        );
      case AnalyticsEvents.kButtonClick:
        await _analytics.logEvent(name: event.name, parameters: parameters);
      case AnalyticsEvents.kPurchaseComplete:
        await _analytics.logPurchase(
          value: jsonDecodeDouble(parameters[AnalyticsEvents.kPurchaseValue]),
          currency: parameters[AnalyticsEvents.kPurchaseCurrency] as String?,
          transactionId:
              parameters[AnalyticsEvents.kPurchaseTransactionId] as String?,
          // TODO(arenukvern): add other parameters
          parameters: parameters,
        );
      default:
        await _analytics.logEvent(
          name: event.name,
          parameters: event.parameters as Map<String, Object>?,
        );
    }
  }

  @override
  Future<void> setUserProperty(final String name, final String? value) async {
    if (!_isEnabled) return;
    await _analytics.setUserProperty(name: name, value: value);
  }

  @override
  Future<void> setUserId(final String? id) async {
    if (!_isEnabled) return;
    await _analytics.setUserId(id: id);
  }

  @override
  void dispose() {
    // No specific disposal needed for Firebase Analytics
  }
}
