

import 'package:blood_donation_management_system/features/authentication/register/data/repository/register_repository_impl.dart';
import 'package:blood_donation_management_system/features/authentication/register/data/service/register_service.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/notifier/register_notifier.dart';
import 'package:blood_donation_management_system/features/authentication/register/presentation/notifier/register_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerServiceProvider = Provider((ref) => RegisterService());
final registerRepositoryProvider = Provider((ref) {
  final registerService = ref.watch(registerServiceProvider);
  return RegisterRepositoryImpl(registerService);
});

final registerNotifierProvider = NotifierProvider<RegisterNotifier,RegisterStateModel>(() => RegisterNotifier());