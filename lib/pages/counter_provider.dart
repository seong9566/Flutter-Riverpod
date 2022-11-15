import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'count_repository.dart';

final counterProvider = StateNotifierProvider<CounterRepository, int>((ref) {
  return CounterRepository();
});
