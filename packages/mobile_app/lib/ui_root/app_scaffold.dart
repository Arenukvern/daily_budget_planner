import 'package:flutter/foundation.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile_app/common_imports.dart';

class DBPApp extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const DBPApp(this.initializer);
  final GlobalInitializerImpl initializer;
  @override
  State<DBPApp> createState() => _DBPAppState();
}

class _DBPAppState extends State<DBPApp> {
  bool _isDiLoaded = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      unawaited(_loadDi());
    });
  }

  Future<void> _loadDi() async {
    _initializeLocalization();
    await Di.init(analyticsManager: widget.initializer.analyticsManager);
    setState(() => _isDiLoaded = true);
  }

  void _initializeLocalization() => LocalizationConfig.initialize(
    LocalizationConfig(
      supportedLanguages: [languages.en, languages.ru, languages.it],
      fallbackLanguage: languages.en,
    ),
  );
  @override
  void dispose() {
    Di.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => ColoredBox(
    color: AppThemeData.brandDark.colorScheme.surface,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          if (!_isDiLoaded) const LoadingScreen(),
          if (_isDiLoaded)
            GlobalStateProviders(
              builder: (final context) => const AppScaffoldBuilder(),
            ),
        ],
      ),
    ),
  );
}

class AppScaffoldBuilder extends StatelessWidget {
  const AppScaffoldBuilder({super.key});
  @override
  Widget build(final BuildContext context) {
    final locale = context.select<AppSettingsNotifier, Locale>(
      (final c) => c.locale.value,
    );
    final themeMode = context.select<AppSettingsNotifier, ThemeMode>(
      (final c) => c.value.brightness.themeMode,
    );
    final app = MaterialApp.router(
      routerConfig: router,
      themeMode: kDebugMode ? themeMode : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        ...S.localizationsDelegates,
        FormBuilderLocalizations.delegate,
      ],

      /// Providing a restorationScopeId allows the Navigator built by
      /// the MaterialApp to restore the navigation stack when a user
      /// leaves and returns to the app after it has been killed while
      /// running in the background.
      restorationScopeId: 'app',
      locale: locale,
      supportedLocales: Locales.values,
      theme: AppThemeData.brandLight,
      darkTheme: AppThemeData.brandDark,
    );
    if (Envs.isWiredashAvailable) {
      return UserFeedback.wiredash(
        dto: UserFeedbackWiredashDto(
          projectId: Envs.wiredashProjectId,
          secret: Envs.wiredashSecret,
          options: WiredashOptionsData(
            locale: locale,
            localizationDelegate: const CustomWiredashTranslationsDelegate(),
          ),
          feedbackOptions: _getWiredashOptions(locale),
          theme: WiredashThemeData.fromColor(
            primaryColor: AppThemeData.brandDark.primaryColor,
            brightness: Brightness.light,
          ),
        ),
        child: app,
      );
    }
    return app;
  }

  WiredashFeedbackOptions _getWiredashOptions(final Locale locale) =>
      WiredashFeedbackOptions(
        labels: [
          Label(
            id: 'label-jcgd4lyfk9',
            title: LocalizedMap({
              languages.en: 'Bug report',
              languages.ru: 'Сообщить об ошибке',
              languages.it: 'Segnala un bug',
            }).getValue(locale),
          ),
          Label(
            id: 'label-dqi42ue2re',
            title: LocalizedMap({
              languages.en: 'Feature request',
              languages.ru: 'Предложить функцию',
              languages.it: 'Proponi una funzione',
            }).getValue(locale),
          ),
          Label(
            id: 'label-n63w8nqhcn',
            title: LocalizedMap({
              languages.en: 'Payment issue',
              languages.ru: 'Проблема с оплатой',
              languages.it: 'Problema con il pagamento',
            }).getValue(locale),
          ),
          Label(
            id: 'label-8tnmqrfat4',
            title: LocalizedMap({
              languages.en: 'Other',
              languages.ru: 'Другое',
              languages.it: 'Altro',
            }).getValue(locale),
          ),
        ],
      );
}
