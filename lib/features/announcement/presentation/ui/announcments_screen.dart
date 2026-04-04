
import 'package:blood_donation_management_system/core/theme/extension/bdms_colors.dart';
import 'package:blood_donation_management_system/core/theme/extension/bdms_text_theme.dart';
import 'package:blood_donation_management_system/core/widgets/box_decoration.dart';
import 'package:blood_donation_management_system/features/announcement/presentation/provier/announcements_provider.dart';
import 'package:blood_donation_management_system/features/announcement/presentation/widget/announcement_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/theme_getter.dart';
import '../../../../core/widgets/app_bar.dart';
import '../../../../core/widgets/elevated_button_widget.dart';
import '../../../../core/widgets/side_drawer.dart';

class AnnouncementsScreen extends ConsumerStatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  ConsumerState<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends ConsumerState<AnnouncementsScreen> {
      @override
      void initState(){
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          getAnnouncements();
        });
      }

      void getAnnouncements() {
        ref.read(announcementNotifierProvider.notifier).getAnnouncements();

      }
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Scaffold(
      appBar: AppBarWidget(logo: "assets/images/Logo_white.svg", barIcon: "assets/images/bars_white_icon.svg",bgColor: colorScheme.primary,),
      endDrawer: SideDrawer(isDashboard: false),
      backgroundColor: colorScheme.secondary,
      body:  buildAnnouncementsScreen(textTheme, colorScheme, customColors),
    );
  }

  Widget buildAnnouncementsScreen(BDMSTextTheme textTheme, ColorScheme colorScheme, BDMSColors customColors) {
   final announcementState =   ref.watch(announcementNotifierProvider);
   final announcements = announcementState.announcementModel?.data;


   if(announcementState.isLoading) return AnnouncementShimmer();
   if (announcements == null && announcements!.data!.isEmpty) {
     return const Center(child: Text("There are no announcements"));
   }
   if(announcementState.isFailed) {
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
               getAnnouncements();
             },
           ),
         ],
       ),
     );
   }
   return  CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                      const SizedBox(height: 20),
                      Text(
                        "The Vital Pulse",
                        style: textTheme.subTitle.copyWith(color:  colorScheme.primary),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Stay informed about critical needs, community impact, and upcoming donor events in your area.",
                        style:textTheme.bodyRegular.copyWith(color: customColors.darkPrimary),
                      ),
                      const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        SliverList.builder(
            itemCount:  announcements.data?.length,
            itemBuilder: (context, index){
            final  announcement = announcements.data![index];
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: AnnouncementCard(title: announcement.title!, subtitle: announcement.content!),
              );
            })
      ],
    ) ;
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const AnnouncementCard({
    super.key,
    required this.title,
    required this.subtitle,

  });
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final customColors = context.colors;
    final textTheme = context.bdmsText;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      decoration: boxDecoration(cardColor: colorScheme.secondary, shadowColor: customColors.disabled),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SvgPicture.asset(
        width: 30,
        height: 30,
        "assets/images/announcment_icon.svg",
          ), const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.subTitle.copyWith(color: customColors.darkPrimary),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: textTheme.tabText.copyWith(color: customColors.disabled),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}