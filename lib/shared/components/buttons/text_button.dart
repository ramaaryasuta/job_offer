import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';

class MTextButton extends StatelessWidget {
  const MTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.size = MTextButtonSize.medium,
    this.variant = MTextButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isLoading;
  final MTextButtonSize size;
  final MTextButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    final foregroundColor = switch (variant) {
      MTextButtonVariant.primary => colorScheme.primary,
      MTextButtonVariant.secondary => colorScheme.secondary,
      MTextButtonVariant.danger => colorScheme.error,
      MTextButtonVariant.neutral => colorScheme.onSurface,
    };

    final (padding, textStyle, iconSize, loaderSize) = switch (size) {
      MTextButtonSize.small => (
        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        context.textTheme.labelMedium,
        16.0,
        14.0,
      ),
      MTextButtonSize.medium => (
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        context.textTheme.labelLarge,
        18.0,
        16.0,
      ),
      MTextButtonSize.large => (
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  const SizedBox(width: 6),
                ],
                Text(label, style: textStyle?.copyWith(color: foregroundColor)),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 6),
                  IconTheme(
                    data: IconThemeData(size: iconSize, color: foregroundColor),
                    child: trailingIcon!,
                  ),
                ],
              ],
            ),
    );

    return TextButton(
      onPressed: isDisabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: buttonChild,
    );
  }
}

enum MTextButtonSize { small, medium, large }

enum MTextButtonVariant { primary, secondary, danger, neutral }
