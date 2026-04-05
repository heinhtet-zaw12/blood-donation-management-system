import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'app_storage.dart';

final appStorageProvider = Provider<AppStorage>((ref) {
  return GetIt.I.get<AppStorage>();
});