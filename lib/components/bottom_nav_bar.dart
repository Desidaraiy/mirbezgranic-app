import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTabChange;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Align(
            alignment: Alignment(0.0, 1.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 24),
              decoration: const BoxDecoration(
                  color: AppColors.lavender,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onTabChange?.call(0),
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(12),

                        child: SvgPicture.asset(selectedIndex == 0
                            ? AppIcons.home
                            : AppIcons.home_outline),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onTabChange?.call(1),
                      child: Ink(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(selectedIndex == 1
                            ? AppIcons.document
                            : AppIcons.document_outline),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onTabChange?.call(2),
                      child: Ink(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(selectedIndex == 2
                            ? AppIcons.theatre
                            : AppIcons.theatre_outline),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onTabChange?.call(3),
                      child: Ink(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(selectedIndex == 3
                            ? AppIcons.location
                            : AppIcons.location_outline),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onTabChange?.call(4),
                      child: Ink(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(selectedIndex == 4
                            ? AppIcons.profile
                            : AppIcons.profile_outline),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }
}
