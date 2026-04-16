import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/privacy_policy_lang.dart';

/// AppBar `actions` içinde kullanılır.
class PrivacyLanguageSelector extends StatelessWidget {
  const PrivacyLanguageSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.selectedForegroundColor,
    this.selectedBackgroundColor,
    this.foregroundColor,
  });

  final PrivacyPolicyLang value;
  final ValueChanged<PrivacyPolicyLang> onChanged;
  final Color? selectedForegroundColor;
  final Color? selectedBackgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: SegmentedButton<PrivacyPolicyLang>(
        style: SegmentedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedForegroundColor: selectedForegroundColor,
          selectedBackgroundColor: selectedBackgroundColor,
          foregroundColor: foregroundColor,
        ),
        segments: const [
          ButtonSegment(value: PrivacyPolicyLang.tr, label: Text('TR')),
          ButtonSegment(value: PrivacyPolicyLang.en, label: Text('EN')),
        ],
        showSelectedIcon: false,
        selected: {value},
        onSelectionChanged: (Set<PrivacyPolicyLang> s) =>
            onChanged(s.single),
      ),
    );
  }
}
