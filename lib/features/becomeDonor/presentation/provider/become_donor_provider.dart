
import 'package:blood_donation_management_system/features/becomeDonor/data/repository/become_donor_repository_impl.dart';
import 'package:blood_donation_management_system/features/becomeDonor/data/service/become_donor_service.dart';
import 'package:blood_donation_management_system/features/becomeDonor/domain/repository/ibecome_donor_repository.dart';
import 'package:blood_donation_management_system/features/becomeDonor/presentation/notifier/becomeDonor_notifier.dart';
import 'package:blood_donation_management_system/features/becomeDonor/presentation/notifier/becomeDonor_state_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final becomeDonorServiceProvider = Provider<BecomeDonorService>((ref) => BecomeDonorService());
final becomeDonorRepositoryProvider = Provider<IbecomeDonorRepository>((ref) {
    final service = ref.watch(becomeDonorServiceProvider);
  return BecomeDonorRepositoryImpl(service);
});
final becomeDonorNotifierProvider = NotifierProvider<BecomedonorNotifier,BecomeDonorStateModel>(() => BecomedonorNotifier());