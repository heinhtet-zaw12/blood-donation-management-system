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
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              SizedBox(height: 20),
              UrgentRequestCard(),
              SizedBox(height: 20),
              DonationEligibilityCard(),
              SizedBox(height: 20),
              BloodPressureCard(),
              SizedBox(height: 20),
              AppointmentCard(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


}

