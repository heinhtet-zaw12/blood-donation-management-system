import 'package:blood_donation_management_system/features/donate/data/model/donate_model.dart';
import 'package:flutter_riverpod/legacy.dart';

final donateFormProvider = StateProvider<DonateModel>((ref)=>DonateModel());

enum DonateStep { first, second, third, submit }

final donateStepProvider =
    StateProvider<DonateStep>((ref) => DonateStep.first);