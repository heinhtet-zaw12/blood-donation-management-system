import 'package:blood_donation_management_system/features/donor/data/repository/donor_repository.dart';
import 'package:blood_donation_management_system/features/donor/data/service/donor_service.dart';
import 'package:blood_donation_management_system/features/donor/presentation/notifier/donor_notifier.dart';
import 'package:blood_donation_management_system/features/donor/presentation/notifier/donor_notifier_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final donorProfileServiceProvider = Provider((ref) => DonorProfileService());

final donorProfileRepositoryProvider = Provider((ref) {
    final donorProfileService = ref.watch(donorProfileServiceProvider);
 return DonorRepository(donorProfileService);
});


final donorProfileNotifierProvider = NotifierProvider<DonorNotifier,DonorNotifierState>(() => DonorNotifier());