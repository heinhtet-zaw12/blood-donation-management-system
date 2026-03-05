import 'package:flutter/material.dart';
import '../../../core/theme/theme_getter.dart';
import '../widgets/appointment_card.dart';
import '../widgets/blood_pressure_card.dart';
import '../widgets/donation_eligiblity_card.dart';
import '../widgets/urgent_blood_request_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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

