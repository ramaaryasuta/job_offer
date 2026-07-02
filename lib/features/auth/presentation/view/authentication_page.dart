import 'package:flutter/material.dart';

import '../../../../core/services/google_auth_service.dart';
import '../../../../shared/components/buttons/outlined_button.dart';
import '../../../../shared/utils/print_log.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _authService = GoogleAuthService();
  final _tokenCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authService.initialize();

    // Listen token dari Google
    _authService.onTokenReceived.listen((idToken) {
      printLog('idToken: $idToken');
      _tokenCtrl.text = idToken;

      setState(() {});
    });
  }

  @override
  void dispose() {
    _tokenCtrl.dispose();
    _authService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login TokenID Test'),
              const SizedBox(height: 24),

              // // Opsi 1: Pakai Google's official button (recommended)
              // Expanded(
              //   child: const HtmlElementView(viewType: 'google-signin-button'),
              // ),
              TextField(controller: _tokenCtrl, maxLines: 10),

              // Opsi 2: Pakai button Flutter sendiri yang trigger prompt
              const SizedBox(height: 16),
              MOutlinedButton(
                label: 'Sign In with Google',
                onPressed: _authService.signIn,
                isFullWidth: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
