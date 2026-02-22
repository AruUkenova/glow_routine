import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_state.dart';
import '../features/products/product_details_page.dart';
import '../features/products/product_list_page.dart';
import '../features/routine/routine_page.dart';
import '../features/settings/settings_page.dart';

GoRouter buildRouter(AppState appState) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: ProductListPage(appState: appState),
        ),
      ),
      GoRoute(
        path: '/product/:id',
        pageBuilder: (context, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '') ?? -1;
          final tab = state.uri.queryParameters['tab'] ?? 'info';
          return MaterialPage(
            key: state.pageKey,
            child: ProductDetailsPage(appState: appState, id: id, tab: tab),
          );
        },
      ),
      GoRoute(
        path: '/routine/:type',
        pageBuilder: (context, state) {
          final type = state.pathParameters['type'] ?? 'morning';
          final date = state.uri.queryParameters['date']; // optional
          return MaterialPage(
            key: state.pageKey,
            child: RoutinePage(appState: appState, type: type, dateIso: date),
          );
        },
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) {
          final tab = state.uri.queryParameters['tab'] ?? 'security';
          return MaterialPage(
            key: state.pageKey,
            child: SettingsPage(appState: appState, tab: tab),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      child: Scaffold(
        appBar: AppBar(title: const Text('Route error')),
        body: Center(child: Text(state.error.toString())),
      ),
    ),
  );
}