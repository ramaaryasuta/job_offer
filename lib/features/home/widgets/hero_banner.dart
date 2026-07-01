import 'package:flutter/material.dart';

import '../../../core/extension/context_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/components/buttons/filled_button.dart';
import '../../../shared/components/images/asset_image.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            context.colorScheme.primary.withValues(alpha: .3),
            context.colorScheme.primary.withValues(alpha: .6),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            spacing: 20,
            children: [
              const SizedBox(height: 40),
              SelectableText(
                'One Place for Every Job Offer',
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  spacing: 8,
                  mainAxisSize: .min,
                  children: [
                    Text(
                      'AI-POWERED PLATFORM',
                      style: context.textTheme.labelSmall!.copyWith(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.auto_awesome_sharp,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: SelectableText(
                  'Track Every Opportunity. Never Miss the Right Offer.',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SelectableText(
                'OfferZ helps job seekers organize applications, monitor recruitment progress, compare offers, and stay on top of every opportunity from a single dashboard.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium!.copyWith(),
              ),
              MFilledButton(
                size: MFilledButtonSize.medium,
                label: 'Join Now',
                trailingIcon: const Icon(Icons.chevron_right_rounded),
                onPressed: () {},
              ),
              Row(
                spacing: 6,
                mainAxisSize: .min,
                children: [
                  Text(
                    'Seamlessly integrated with',
                    style: context.textTheme.bodySmall!.copyWith(),
                  ),
                  MAssetImage(Assets.icons.google, width: 16),
                  SelectableText(
                    'Google APi',
                    style: context.textTheme.bodySmall!.copyWith(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
