import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class MFilledButton extends StatelessWidget {
  const MFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.size = MFilledButtonSize.medium,
    this.variant = MFilledButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isLoading;
  final bool isFullWidth;
  final MFilledButtonSize size;
  final MFilledButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final backgroundColor = switch (variant) {
      MFilledButtonVariant.primary => colorScheme.primary,
      MFilledButtonVariant.secondary => colorScheme.secondary,
      MFilledButtonVariant.danger => colorScheme.error,
      MFilledButtonVariant.neutral => colorScheme.surfaceContainerHighest,
    };

    final foregroundColor = switch (variant) {
      MFilledButtonVariant.primary => colorScheme.onPrimary,
      MFilledButtonVariant.secondary => colorScheme.onSecondary,
      MFilledButtonVariant.danger => colorScheme.onError,
      MFilledButtonVariant.neutral => colorScheme.onSurface,
    };

    final (padding, textStyle, iconSize, loaderSize) = switch (size) {
      MFilledButtonSize.small => (
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        context.textTheme.labelMedium,
        16.0,
        14.0,
      ),
      MFilledButtonSize.medium => (
        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        context.textTheme.labelLarge,
        18.0,
        16.0,
      ),
      MFilledButtonSize.large => (
        const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        context.textTheme.titleSmall,
        20.0,
        18.0,
      ),
    };

    final isDisabled = onPressed == null || isLoading;

    Widget buttonChild = AnimatedSwitcher(
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

    final button = FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
        disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: buttonChild,
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}

enum MFilledButtonSize { small, medium, large }

enum MFilledButtonVariant { primary, secondary, danger, neutral }
