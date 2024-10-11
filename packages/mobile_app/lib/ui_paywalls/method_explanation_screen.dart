import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/hooks/use_monetization_type.dart';

/// {@template method_explanation_screen}
/// An interactive screen that guides users through the budgeting method.
/// {@endtemplate}
class MethodExplanationScreen extends StatefulWidget {
  /// {@macro method_explanation_screen}
  const MethodExplanationScreen({
    required this.isFirstOpening,
    super.key,
  });
  final bool isFirstOpening;

  @override
  State<MethodExplanationScreen> createState() =>
      _MethodExplanationScreenState();
}

final _kMoneyPrefix = LocalizedMap(
  value: {
    languages.en: r'$',
    languages.ru: '₽',
    languages.it: '€',
  },
);

class _MethodExplanationScreenState extends State<MethodExplanationScreen>
    with HasStates {
  final PageController _pageController = PageController();
  double? currentBalance;
  double? expenses;
  DateTime? nextSalaryDate;
  double? dailyBudget;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page! < 3) {
      unawaited(
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  void _previousPage() {
    if (_pageController.page! > 0) {
      unawaited(
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _calculateDailyBudget() {
    if (currentBalance != null && expenses != null && nextSalaryDate != null) {
      final availableBalance = currentBalance! - expenses!;
      final daysUntilSalary =
          nextSalaryDate!.difference(DateTime.now()).inDays + 1;
      setState(() {
        dailyBudget = availableBalance / daysUntilSalary;
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Scaffold(
      appBar: AppBar(
        leading: () {
          final back = CupertinoNavigationBarBackButton(
            onPressed: _previousPage,
          );
          if (widget.isFirstOpening) {
            if (_pageController.hasClients && _pageController.page! > 0) {
              return back;
            } else {
              return SizedBox();
            }
          } else {
            return back;
          }
        }(),
        title: Text(
          LocalizedMap(
            value: {
              languages.en: 'Magic of Budgeting',
              languages.ru: 'Магия бюджетирования',
              languages.it: 'Magia del Budgeting',
            },
          ).getValue(locale),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _BalancePage(
            onNext: (final value) {
              setState(() => currentBalance = value);
              _nextPage();
            },
          ),
          _ExpensesPage(
            onNext: (final value) {
              setState(() => expenses = value);
              _nextPage();
            },
          ),
          _SalaryDatePage(
            onNext: (final value) {
              setState(() => nextSalaryDate = value);
              _calculateDailyBudget();
              _nextPage();
            },
          ),
          _ResultPage(
            isFirstOpening: widget.isFirstOpening,
            currentBalance: currentBalance,
            expenses: expenses,
            nextSalaryDate: nextSalaryDate,
            dailyBudget: dailyBudget,
            onFinish: () {
              monthlyCubit
                ..onAmountChange(currentBalance.toString())
                ..onSavingsChange(expenses.toString())
                ..onUpdateNextBudgetDay(nextSalaryDate);

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _BalancePage extends StatelessWidget {
  const _BalancePage({required this.onNext});

  final void Function(double) onNext;

  @override
  Widget build(final BuildContext context) {
    final controller = TextEditingController();
    final locale = useLocale(context);
    return _GuidePage(
      title: LocalizedMap(
        value: {
          languages.en: "What's in Your Pocket?",
          languages.ru: 'Что у тебя в кармансах?',
          languages.it: "Cosa c'è nel tuo portafoglio?",
        },
      ).getValue(locale),
      description: LocalizedMap(
        value: {
          languages.en:
              "Let's start with how much money you have right now. Don't worry, we won't tell anyone! 🤫",
          languages.ru:
              'Давайте начнем с того, сколько у вас денег прямо сейчас. Не волнуйтесь, мы никому не расскажем! 🤫',
          languages.it:
              'Iniziamo con quanto denaro hai in questo momento. Non preoccuparti, non lo diremo a nessuno! 🤫',
        },
      ).getValue(locale),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixText: _kMoneyPrefix.getValue(locale),
          hintText: LocalizedMap(
            value: {
              languages.en: 'Enter your current balance',
              languages.ru: 'Введите ваш текущий баланс',
              languages.it: 'Inserisci il tuo saldo attuale',
            },
          ).getValue(locale),
        ),
      ),
      onNext: () {
        final value = double.tryParse(controller.text);
        if (value != null && value > 0) {
          onNext(value);
        }
      },
    );
  }
}

class _ExpensesPage extends StatelessWidget {
  const _ExpensesPage({required this.onNext});

  final void Function(double) onNext;

  @override
  Widget build(final BuildContext context) {
    final controller = TextEditingController();
    final locale = useLocale(context);
    return _GuidePage(
      title: LocalizedMap(
        value: {
          languages.en: 'Time for Some Adulting',
          languages.ru: 'Время для взрослой жизни',
          languages.it: 'È ora di fare gli adulti',
        },
      ).getValue(locale),
      description: LocalizedMap(
        value: {
          languages.en:
              "Now, let's add up all the boring stuff you need to pay for. Think rent, subscriptions, loan payments - you know, the essentials. 💸",
          languages.ru:
              'Теперь давайте сложим все скучные вещи, за которые вам нужно платить. Думайте об аренде, подписках, платежах по кредиту - вы знаете, о существенном. 💸',
          languages.it:
              "Ora, sommiamo tutte le cose noiose che devi pagare. Pensa all'affitto, agli abbonamenti, ai pagamenti dei prestiti - sai, le cose essenziali. 💸",
        },
      ).getValue(locale),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixText: _kMoneyPrefix.getValue(locale),
          hintText: LocalizedMap(
            value: {
              languages.en: 'Enter your total expenses',
              languages.ru: 'Введите ваши общие расходы',
              languages.it: 'Inserisci le tue spese totali',
            },
          ).getValue(locale),
        ),
      ),
      onNext: () {
        final value = double.tryParse(controller.text);
        if (value != null && value >= 0) {
          onNext(value);
        }
      },
    );
  }
}

class _SalaryDatePage extends StatelessWidget {
  const _SalaryDatePage({required this.onNext});

  final void Function(DateTime) onNext;

  @override
  Widget build(final BuildContext context) {
    DateTime? selectedDate;
    final locale = useLocale(context);
    return _GuidePage(
      title: LocalizedMap(
        value: {
          languages.en: 'When Does the Money Train Arrive?',
          languages.ru: 'Когда приходит денежный поезд?',
          languages.it: 'Quando arriva il treno dei soldi?',
        },
      ).getValue(locale),
      description: LocalizedMap(
        value: {
          languages.en:
              "Last step! When's your next payday? This helps us figure out how long your money needs to last. 🗓️",
          languages.ru:
              'Последний шаг! Когда ваша следующая зарплата? Это помогает нам выяснить, сколько денег вам нужно на пропитание. 🗓️',
          languages.it:
              'Ultimo passo! Quando è il tuo prossimo giorno di paga? Questo ci aiuta a capire per quanto tempo devono durare i tuoi soldi. 🗓️',
        },
      ).getValue(locale),
      content: ElevatedButton(
        child: Text(
          selectedDate == null
              ? LocalizedMap(
                  value: {
                    languages.en: 'Select Next Salary Date',
                    languages.ru: 'Выберите дату следующей зарплаты',
                    languages.it: 'Seleziona la data del prossimo stipendio',
                  },
                ).getValue(locale)
              : DateFormat('MMM d, y').format(selectedDate),
        ),
        onPressed: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(const Duration(days: 30)),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)),
          );
          if (date != null) {
            selectedDate = date;
            onNext(date);
          }
        },
      ),
      onNext: null,
    );
  }
}

class _ResultPage extends StatelessWidget {
  const _ResultPage({
    required this.currentBalance,
    required this.expenses,
    required this.nextSalaryDate,
    required this.dailyBudget,
    required this.onFinish,
    required this.isFirstOpening,
  });

  final bool isFirstOpening;
  final double? currentBalance;
  final double? expenses;
  final DateTime? nextSalaryDate;
  final double? dailyBudget;
  final VoidCallback onFinish;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final (:isSubscriptionMonetization) =
        useIsSubscriptionMonetization(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocalizedMap(
              value: {
                languages.en: '🎉 Congratulations!',
                languages.ru: '🎉 Поздравляем!',
                languages.it: '🎉 Congratulazioni!',
              },
            ).getValue(locale),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ).animate().fadeIn().slideX(),
          const SizedBox(height: 16),
          Text(
            LocalizedMap(
              value: {
                languages.en:
                    "You've just mastered the art of simple budgeting! Here's your financial snapshot:",
                languages.ru:
                    'Вы только что освоили искусство простого бюджетирования! Вот ваш финансовый снимок:',
                languages.it:
                    "Hai appena padroneggiato l'arte del budgeting semplice! Ecco il tuo snapshot finanziario:",
              },
            ).getValue(locale),
            style: Theme.of(context).textTheme.bodyLarge,
          ).animate().fadeIn().slideX(),
          const SizedBox(height: 24),
          _ResultCard(
            currentBalance: currentBalance,
            expenses: expenses,
            nextSalaryDate: nextSalaryDate,
            dailyBudget: dailyBudget,
          ),
          const SizedBox(height: 24),
          Text(
            LocalizedMap(
              value: {
                languages.en:
                    "Now you know exactly how much you can spend each day without ending up with holey socks 🧦. Remember, this is a tool - some days you might spend less, others a bit more. The key is to stay aware and make informed decisions. You've got this! 💪",
                languages.ru:
                    'Теперь вы точно знаете, сколько можете тратить каждый день, чтобы не дойти до дырявых носок 🧦. Помните, это инструмент - в некоторые дни вы можете тратить меньше, в другие - немного больше. Главное - оставаться в курсе и принимать обоснованные решения. У вас все получится! 💪',
                languages.it:
                    "Ora sai esattamente quanto puoi spendere ogni giorno senza ritrovarti con i calzini bucati 🧦. Ricorda, questo è uno strumento - alcuni giorni potresti spendere meno, altri un po' di più. La chiave è rimanere consapevoli e prendere decisioni informate. Ce la puoi fare! 💪",
              },
            ).getValue(locale),
            style: Theme.of(context).textTheme.bodyLarge,
          ).animate().fadeIn().slideX(),
          const SizedBox(height: 24),
          if (isFirstOpening && isSubscriptionMonetization) ...[
            Text(
              LocalizedMap(
                value: {
                  languages.en:
                      'The basic functions of this app are free. To use the most advanced and extra functions, there is a subscription available.',
                  languages.ru:
                      'Основные функции этого приложения бесплатны. Для использования самых продвинутых и дополнительных функций доступна подписка.',
                  languages.it:
                      'Le funzioni di base di questa app sono gratuite. Per utilizzare le funzioni più avanzate ed extra, è disponibile un abbonamento.',
                },
              ).getValue(locale),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onFinish,
                  child: Text(
                    LocalizedMap(
                      value: {
                        languages.en: 'Continue Free',
                        languages.ru: 'Продолжить бесплатно',
                        languages.it: 'Continua gratis',
                      },
                    ).getValue(locale),
                  ),
                ).animate().fadeIn().slideX(),
                ElevatedButton(
                  onPressed: () {
                    final controller = AppPathsController.of(context);
                    // Save the entered data
                    onFinish();
                    controller.toPaywall();
                  },
                  child: Text(
                    LocalizedMap(
                      value: {
                        languages.en: 'Purchase',
                        languages.ru: 'Купить',
                        languages.it: 'Acquista',
                      },
                    ).getValue(locale),
                  ),
                ).animate().fadeIn().slideX(),
              ],
            ),
          ] else
            Center(
              child: ElevatedButton(
                onPressed: onFinish,
                child: Text(
                  LocalizedMap(
                    value: {
                      languages.en: "Cool! Let's start!",
                      languages.ru: 'Круто! Давайте продолжим!',
                      languages.it: 'Fantastico! Iniziamo!',
                    },
                  ).getValue(locale),
                ),
              ).animate().fadeIn().slideX(),
            ),
          const SizedBox(height: 16),
          Text(
            LocalizedMap(
              value: {
                languages.en:
                    'Disclaimer: This is not financial advice. Please consult with a qualified financial advisor for personalized recommendations.',
                languages.ru:
                    'Отказ от ответственности: пожалуйста обратите внимание - это не финансовая консультация. Пожалуйста, проконсультируйтесь с квалифицированным финансовым консультантом для получения персонализированных рекомендаций.',
                languages.it:
                    'Disclaimer: Questo non è un consiglio finanziario. Si prega di consultare un consulente finanziario qualificato per raccomandazioni personalizzate.',
              },
            ).getValue(locale),
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ).animate().fadeIn(),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.currentBalance,
    required this.expenses,
    required this.nextSalaryDate,
    required this.dailyBudget,
  });

  final double? currentBalance;
  final double? expenses;
  final DateTime? nextSalaryDate;
  final double? dailyBudget;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ResultRow(
              LocalizedMap(
                value: {
                  languages.en: 'Current Balance:',
                  languages.ru: 'Текущий баланс:',
                  languages.it: 'Saldo attuale:',
                },
              ).getValue(locale),
              '${_kMoneyPrefix.getValue(locale)}${currentBalance?.toStringAsFixed(2)}',
            ),
            _ResultRow(
              LocalizedMap(
                value: {
                  languages.en: 'Required Expenses:',
                  languages.ru: 'Необходимые расходы:',
                  languages.it: 'Spese necessarie:',
                },
              ).getValue(useLocale(context)),
              '${_kMoneyPrefix.getValue(locale)}${expenses?.toStringAsFixed(2)}',
            ),
            _ResultRow(
              LocalizedMap(
                value: {
                  languages.en: 'Next Salary Date:',
                  languages.ru: 'Дата следующей зарплаты:',
                  languages.it: 'Data del prossimo stipendio:',
                },
              ).getValue(locale),
              DateFormat('MMM d, y').format(nextSalaryDate!),
            ),
            const Divider(),
            _ResultRow(
              LocalizedMap(
                value: {
                  languages.en: 'Your Daily Budget:',
                  languages.ru: 'Ваш ежедневный бюджет:',
                  languages.it: 'Il tuo budget giornaliero:',
                },
              ).getValue(locale),
              '${_kMoneyPrefix.getValue(locale)}${dailyBudget?.toStringAsFixed(2)}',
              isHighlighted: true,
            ),
          ],
        ),
      ),
    ).animate().fadeIn().scale();
  }
}

class _ResultRow extends StatelessWidget {
  const _ResultRow(this.label, this.value, {this.isHighlighted = false});

  final String label;
  final String value;
  final bool isHighlighted;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                color: isHighlighted
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
          ],
        ),
      );
}

class _GuidePage extends StatelessWidget {
  const _GuidePage({
    required this.title,
    required this.description,
    required this.content,
    required this.onNext,
  });

  final String title;
  final String description;
  final Widget content;
  final VoidCallback? onNext;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 16),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 24),
            content.animate().fadeIn().scale(),
            const SizedBox(height: 24),
            if (onNext != null)
              ElevatedButton(
                onPressed: onNext,
                child: Text(
                  LocalizedMap(
                    value: {
                      languages.en: 'Next',
                      languages.ru: 'Далее',
                      languages.it: 'Avanti',
                    },
                  ).getValue(useLocale(context)),
                ),
              ).animate().fadeIn().slideX(),
          ],
        ),
      );
}
