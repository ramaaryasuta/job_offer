import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

class GoogleAuthService {
  final _tokenController = StreamController<String>.broadcast();

  Stream<String> get onTokenReceived => _tokenController.stream;

  void initialize() {
    // Expose Flutter callback ke JS global scope
    globalContext['flutterGoogleCallback'] = ((JSString idToken) {
      _tokenController.add(idToken.toDart);
    }).toJS;

    // Panggil initGoogleSignIn dari google_auth.js
    globalContext.callMethod(
      'initGoogleSignIn'.toJS,
      ((JSString idToken) {
        _tokenController.add(idToken.toDart);
      }).toJS,
    );
  }

  void signIn() {
    globalContext.callMethod('promptGoogleSignIn'.toJS);
  }

  void renderButton(String elementId) {
    globalContext.callMethod('renderGoogleButton'.toJS, elementId.toJS);
  }

  void dispose() {
    _tokenController.close();
  }
}
