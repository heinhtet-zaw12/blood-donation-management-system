import 'package:blood_donation_management_system/core/storage/app_storage.dart';
import 'package:blood_donation_management_system/core/widgets/Shimmer_widget.dart';
import 'package:blood_donation_management_system/core/widgets/elevated_button_widget.dart';
import 'package:blood_donation_management_system/features/dashboard/presentation/provider/dashboard_provier.dart';
import 'package:blood_donation_management_system/features/dashboard/widgets/become_lifeSaver_card.dart';
import 'package:blood_donation_management_system/features/dashboard/widgets/donation_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/theme/theme_getter.dart';
import '../../../profile/presentation/provider/profile_provider.dart';
import '../../widgets/appointment_card.dart';
import '../../widgets/donation_eligibility_card.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../widgets/urgent_blood_request_card.dart';


class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});
  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  AppStorage _appStorage = GetIt.I.get<AppStorage>();

  @override
  void initState() {
    super.initState();
    fetchUser();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(dashboardNotifierProvider.notifier).getDashboard();
    });

  }
  void fetchUser() async{
    String? userId = await _appStorage.getUserId();
   if(userId != null)  ref.read(userProfileNotifierProvider.notifier).getProfile(userId: userId);

  }
  void retry(){
    ref.read(dashboardNotifierProvider.notifier).getDashboard();
    fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
        dashboardNotifierProvider.select((state) => state.isLoading)
    );
    final isFailed = ref.watch(
        dashboardNotifierProvider.select((state) => state.isFailed)
    );
    final isFailedUser = ref.watch(userProfileNotifierProvider.select((state) => state.isFailed));
    final isLoadingUser = ref.watch(userProfileNotifierProvider.select((state) => state.isLoading));
    final isloading =isLoading || isLoadingUser;
    final isError = isFailed || isFailedUser;

    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Scaffold(
      backgroundColor: customColors.background,
      body: SafeArea(
        child: buildDashboard(isloading,isError),
      ),
    );
  }

  Widget buildDashboard(bool isLoading, bool isError) {
    if (isLoading) {
      return ShimmerWidget();
    }
    if (isError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            const Text("Something went wrong!"),
            const SizedBox(height: 16),
            ElevatedButtonWidget(
              text: "Retry",
              onPressed: (){
                retry();
              },
            ),
          ],
        ),
      );
    }
    return SingleChildScrollView(
                 child: Column(
          children:
          [ //Become a life Saver
            Padding(
                padding: EdgeInsets.all(16),
                child:  BecomeLifesaverCard(),
              ) ,

            //Urgent Request Card
            Padding(
              padding: EdgeInsets.all(16),
              child: UrgentRequestCard(),
            ),

            //Donation Eligibility
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16),
              child: DonationEligibilityCard(),
            ),

            //Donation RequestCard
            const SizedBox(height: 20),
            DonationRequestCard(),

            //Appointment Card
          const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16),
              child: AppointmentCard(),
            ),
           const SizedBox(height: 40),
          ],
        ),
      );
  }


}

