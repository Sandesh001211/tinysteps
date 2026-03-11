import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/constants/app_theme.dart';

/// Teacher Home Screen — Squad C's home base
/// TODO (Attendance/QR Squad): Wire up QR scanner + attendance log
class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  Future<void> _signOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final name = user?.userMetadata?['full_name'] as String? ?? 'Teacher';

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        title: const Text('Teacher Dashboard', style: AppTextStyles.heading2),
        backgroundColor: AppColors.bgLight,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good day, $name 📋', style: AppTextStyles.heading1),
            const Text("Ready to take attendance?", style: AppTextStyles.bodyMuted),
            const SizedBox(height: AppSpacing.xl),

            // Scan QR button – primary CTA
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {/* TODO: push QR scanner screen */},
                icon: const Icon(Icons.qr_code_scanner, color: AppColors.white),
                label: const Text(
                  'Scan QR Code',
                  style: TextStyle(fontSize: 18, color: AppColors.white),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            const Text("Today's Attendance", style: AppTextStyles.heading2),
            const SizedBox(height: AppSpacing.md),

            // Placeholder — Squad C will replace with real list
            Center(
              child: Column(
                children: [
                  Icon(Icons.event_note, size: 64, color: AppColors.textMuted.withValues(alpha: 0.4)),
                  const SizedBox(height: AppSpacing.sm),
                  const Text('No scans yet today', style: AppTextStyles.bodyMuted),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
