import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_route.dart';

/// Helper navigasi terpusat.
///
/// Keuntungan memakai class ini dibanding memanggil `context.go()` langsung:
///   - Perubahan nama route cukup di satu tempat
///   - Mudah di-mock saat testing
///   - Keterbacaan kode lebih baik
abstract class NavigationUtils {
  // ── Navigasi dasar ────────────────────────────────────────────────────────

  /// Pindah ke halaman baru dan **push ke history browser**.
  /// Tombol back browser akan kembali ke halaman sebelumnya.
  static void push(BuildContext context, String location) {
    context.push(location);
  }

  /// Pindah ke halaman baru dan **ganti history saat ini**.
  /// Tombol back browser TIDAK akan kembali ke halaman sebelumnya.
  /// Mirip perilaku `<a href="...">` biasa di web.
  static void go(BuildContext context, String location) {
    context.go(location);
  }

  /// Kembali ke halaman sebelumnya (sama dengan tombol back browser).
  static void pop(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }

  // ── Named navigation (type-safe, direkomendasikan) ─────────────────────────

  static void goHome(BuildContext context) {
    context.goNamed(AppRoute.home);
  }

  static void goAuth(BuildContext context) {
    context.goNamed(AppRoute.auth);
  }

  // static void goAbout(BuildContext context) {
  //   context.goNamed(RouteNames.about);
  // }

  /// Navigasi ke halaman detail dengan path param.
  ///
  /// URL yang dihasilkan: `/detail/123`
  // static void goDetail(BuildContext context, {required String id}) {
  //   context.goNamed(
  //     RouteNames.detail,
  //     pathParameters: {'id': id},
  //   );
  // }

  // /// Navigasi ke detail tapi **push** (agar bisa di-back).
  // static void pushDetail(BuildContext context, {required String id}) {
  //   context.pushNamed(
  //     RouteNames.detail,
  //     pathParameters: {'id': id},
  //   );
  // }

  // ── Query params ───────────────────────────────────────────────────────────

  /// Contoh navigasi dengan query parameter.
  ///
  /// URL yang dihasilkan: `/about?tab=team`
  // static void goAboutWithQuery(
  //   BuildContext context, {
  //   required String tab,
  // }) {
  //   context.goNamed(
  //     RouteNames.about,
  //     queryParameters: {'tab': tab},
  //   );
  // }

  // ── Utilitas ───────────────────────────────────────────────────────────────

  /// Cek apakah route saat ini cocok dengan [routeName].
  /// Berguna untuk meng-highlight item navbar yang aktif.
  static bool isCurrentRoute(BuildContext context, String routeName) {
    final router = GoRouter.of(context);
    final location = router.routerDelegate.currentConfiguration.uri.toString();
    // Dapatkan path dari named route untuk perbandingan
    switch (routeName) {
      case AppRoute.home:
        return location == AppRoute.homePath;
      // case AppRoute.about:
      //   return location.startsWith(AppRoute.aboutPath);
      default:
        return false;
    }
  }
}
