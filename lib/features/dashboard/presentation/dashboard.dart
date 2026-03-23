import 'package:blood_donation_management_system/features/dashboard/widgets/become_lifeSaver_card.dart';
import 'package:blood_donation_management_system/features/dashboard/widgets/donation_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/theme_getter.dart';
import '../widgets/appointment_card.dart';
import '../widgets/blood_pressure_card.dart';
import '../widgets/donation_eligiblity_card.dart';
import '../widgets/urgent_blood_request_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Scaffold(
      backgroundColor: customColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16),
                child: BecomeLifesaverCard(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16),
                child: UrgentRequestCard(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16),
                child: DonationEligibilityCard(),
              ),
              SizedBox(height: 20),
              DonationRequestCard(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16),
                child: BloodPressureCard(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(16),
                child: AppointmentCard(),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


}

