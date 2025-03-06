import 'package:flutter/material.dart';
import 'package:mobile_app/core/utils/ordered_map.dart';

class OrderedMapNotifier<K, V> extends ImmutableOrderedMap<K, V>
    with ChangeNotifier {
  @override
  @mustCallSuper
  void upsert(final K key, final V value) {
    super.upsert(key, value);
    notifyListeners();
  }

  @override
  @mustCallSuper
  void remove(final K key) {
    super.remove(key);
    notifyListeners();
  }

  @override
  @mustCallSuper
  void clear() {
    super.clear();
    notifyListeners();
  }
}
