// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color primaryBtnText;
  Color lineColor;
  Color yellow;
  Color redd;
  Color blue;
  Color green;
  Color purple;

  TextStyle get title1 => GoogleFonts.getFont(
        'Open Sans',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Open Sans',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Open Sans',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Open Sans',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Open Sans',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Open Sans',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Open Sans',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF584FBB);
  Color secondaryColor = const Color(0xFF39D2C0);
  Color tertiaryColor = const Color(0xFFEE8B60);
  Color alternate = const Color(0xFFFF5963);
  Color primaryBackground = const Color(0xFF000000);
  Color secondaryBackground = const Color(0xFF2E2E2E);
  Color primaryText = const Color(0xFFFFFFFF);
  Color secondaryText = const Color(0xFFAAAAAA);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFFE0E3E7);
  Color yellow = Color(0xFFFFCD00);
  Color redd = Color(0xFFFF0000);
  Color blue = Color(0xFF009DFF);
  Color green = Color(0xFF2DDD3A);
  Color purple = Color(0xFF6700FF);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
