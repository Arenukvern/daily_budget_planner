import 'package:mobile_app/common_imports.dart';

/// A widget that allows the user to select a language from a menu.
///
/// This widget provides a menu with options for selecting different languages.
/// It uses a [MenuAnchor] to display the menu and a [TextButton] to toggle it.
/// The selected language is displayed in a [Text] widget.
///
/// The [UiLanguageSwitcherMenu] widget is a stateless widget that takes
/// the following parameters:
///
/// @ai The [UiLanguageSwitcherMenu] widget is a stateless widget that takes
/// the following parameters:
///
/// - [value]: The current language selected by the user.
/// - [onChanged]: A callback function that is called when the user
/// selects a new language.
/// - [isShortAbbreviationUsed]: A boolean value that determines whether
/// to use short abbreviations for the language names.
/// - [languages]: A list of languages to display in the menu.
///
/// The widget uses a [MenuAnchor] to display the menu and a [TextButton]
/// to toggle it.
/// The selected language is displayed in a [Text] widget.
class UiLanguageSwitcherMenu extends StatelessWidget {
  const UiLanguageSwitcherMenu({
    required this.value,
    required this.onChanged,
    this.isShortAbbreviationUsed = true,
    this.languages = const [],
    super.key,
  });
  final UiLanguage value;
  final List<UiLanguage> languages;
  final ValueChanged<UiLanguage> onChanged;
  final bool isShortAbbreviationUsed;
  @override
  Widget build(final BuildContext context) {
    final effectiveValues = (languages.isNotEmpty ? languages : UiLanguage.all);
    final List<Widget> menuChildren;

    if (isShortAbbreviationUsed) {
      menuChildren = effectiveValues
          .map(
            (final lang) => MenuItemButton(
              child: Text(lang.name),
              onPressed: () => onChanged(lang),
            ),
          )
          .toList();
    } else {
      menuChildren = namedLocalesMap.entries
          .where((final e) => effectiveValues.contains(e.key))
          .map(
            (final e) => MenuItemButton(
              child: Text(e.value.name),
              onPressed: () => onChanged(e.key),
            ),
          )
          .toList();
    }
    return MenuAnchor(
      menuChildren: menuChildren,
      builder: (final context, final controller, final child) => TextButton(
        onPressed: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        child: Text(
          isShortAbbreviationUsed ? value.name : namedLocalesMap[value]!.name,
        ),
      ),
    );
  }
}
