import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, this.logo, this.barIcon, this.bgColor});
  final String? logo;
  final String? barIcon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 160,
        backgroundColor: bgColor ?? Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading:  Padding(
          padding: const EdgeInsets.only(left: 40),
          child: SizedBox(
            width: 120,
            child: SvgPicture.asset(
              width: 120,
                height: 50,
                logo ?? "assets/images/Logo.svg",
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  width: 35,
                  height: 35,
                  barIcon ?? "assets/images/bars_icon.svg",
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
          )
        ],
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}