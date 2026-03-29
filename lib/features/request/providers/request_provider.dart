import 'package:blood_donation_management_system/features/request/data/model/request_model.dart';
import 'package:flutter_riverpod/legacy.dart';

final requestFormProvider = StateProvider<RequestModel>((ref)=> RequestModel());

enum RequestStep  {first, second, third, submit}

final requestStepProvider = StateProvider<RequestStep>((ref)=> RequestStep.first);
