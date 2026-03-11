import 'package:flutter/material.dart';

// ─── Brand colours ───────────────────────────────────────────────────────────
class AppColors {
  AppColors._();

  static const primary = Color(0xFF6C63FF);
  static const primaryLight = Color(0xFFEEEDFF);
  static const secondary = Color(0xFFFF8C69);
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFFC107);
  static const danger = Color(0xFFE53935);

  static const bgLight = Color(0xFFF8F9FF);
  static const bgDark = Color(0xFF1A1A2E);

  static const textDark = Color(0xFF1A1A2E);
  static const textMuted = Color(0xFF9E9E9E);
  static const white = Color(0xFFFFFFFF);
}

// ─── Text styles ─────────────────────────────────────────────────────────────
class AppTextStyles {
  AppTextStyles._();

  static const heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColors.textDark,
    fontFamily: 'Nunito',
  );

  static const heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    fontFamily: 'Nunito',
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    fontFamily: 'Nunito',
  );

  static const bodyMuted = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    fontFamily: 'Nunito',
  );

  static const labelBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    fontFamily: 'Nunito',
  );
}

// ─── Spacing / radius ────────────────────────────────────────────────────────
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

class AppRadius {
  AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;
  static const double full = 999;
}
