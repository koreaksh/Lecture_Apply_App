import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UijeongbuLogoAppbar extends StatelessWidget {
  final bool blackLogo;
  const UijeongbuLogoAppbar({
    Key? key, this.blackLogo = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(20, 0),
      child: SvgPicture.asset(
        blackLogo == false ? "assets/main/uijeongbu_logo.svg" : "assets/main/uijeongbu_logo_black.svg"
      ),
    );
  }
}