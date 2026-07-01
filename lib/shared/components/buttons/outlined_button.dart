import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class MOutlinedButton extends StatelessWidget {
  const MOutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.size = MOutlinedButtonSize.medium,
    this.variant = MOutlinedButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isLoading;
  final bool isFullWidth;
  final MOutlinedButtonSize size;
  final MOutlinedButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final foregroundColor = switch (variant) {
      MOutlinedButtonVariant.primary => colorScheme.primary,
      MOutlinedButtonVariant.secondary => colorScheme.secondary,
      MOutlinedButtonVariant.danger => colorScheme.error,
      MOutlinedButtonVariant.neutral => colorScheme.onSurface,
    };

    final borderColor = switch (variant) {
      MOutlinedButtonVariant.primary => colorScheme.primary,
      MOutlinedButtonVariant.secondary => colorScheme.secondary,
      MOutlinedButtonVariant.danger => colorScheme.error,
      MOutlinedButtonVariant.neutral => colorScheme.outline,
    };

    final (padding, textStyle, iconSize, loaderSize) = switch (size) {
      MOutlinedButtonSize.small => (
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        context.textTheme.labelMedium,
        16.0,
        14.0,
      ),
      MOutlinedButtonSize.medium => (
        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        context.textTheme.labelLarge,
        18.0,
        16.0,
      ),
      MOutlinedButtonSize.large => (
        const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        context.textTheme.titleSmall,
        20.0,
        18.0,
      ),
    };

    final isDisabled = onPressed == null || isLoading;

    final Widget buttonChild = AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isLoading
          ? SizedBox(
              key: const ValueKey('loader'),
              width: loaderSize,
              height: loaderSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: foregroundColor,
              ),
            )
          : Row(
              key: const ValueKey('content'),
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leadingIcon != null) ...[
                  IconTheme(
                    data: IconThemeData(size: iconSize, color: foregroundColor),
                    child: leadingIcon!,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(label, style: textStyle?.copyWith(color: foregroundColor)),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 8),
                  IconTheme(
                    data: IconThemeData(size: iconSize, color: foregroundColor),
                    child: trailingIcon!,
                  ),
                ],
              ],
            ),
    );

    final button = OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(
          color: isDisabled
              ? colorScheme.onSurface.withValues(alpha: 0.12)
              : borderColor,
        ),
      ),
      child: buttonChild,
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}

enum MOutlinedButtonSize { small, medium, large }

enum MOutlinedButtonVariant { primary, secondary, danger, neutral }
