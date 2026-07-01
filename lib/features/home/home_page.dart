import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../../shared/components/appbar/glass_appbar.dart';
import '../../shared/components/buttons/filled_button.dart';
import '../../shared/components/buttons/text_button.dart';
import 'widgets/hero_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _topPage = GlobalKey();
  final _scrollController = ScrollController();

  bool _showFab = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final show = _scrollController.offset > 600;

      if (show != _showFab) {
        setState(() {
          _showFab = show;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: GlassAppBar(
        title: Text('OfferZ', style: context.textTheme.titleLarge),
        actions: [
          MTextButton(label: 'Login', onPressed: () {}),
          const SizedBox(width: 10),
          MFilledButton(label: 'Sign up', onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: context.viewPadding,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            /// Add Sizedbox for appbar
            SliverToBoxAdapter(
              key: _topPage,
              child: const SizedBox(height: 60),
            ),
            const SliverToBoxAdapter(child: HeroBanner()),
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _showFab ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: IgnorePointer(
          ignoring: !_showFab,
          child: FloatingActionButton(
            onPressed: () {
              Scrollable.ensureVisible(
                _topPage.currentContext!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: const Icon(Icons.keyboard_arrow_up_rounded),
          ),
        ),
      ),
    );
  }
}
