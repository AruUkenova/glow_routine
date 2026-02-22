import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../l10n/app_strings.dart';
import 'product_repository.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({
    super.key,
    required this.appState,
    required this.id,
    required this.tab,
  });

  final AppState appState;
  final int id;
  final String tab;

  final repo = ProductRepository();

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(appState.locale);
    final localeTag = appState.locale.toLanguageTag();

    final product = repo.getById(id);
    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not found')),
        body: Center(child: Text('Product id=$id not found')),
      );
    }

    final openedStr = DateFormat.yMMMMEEEEd(localeTag).format(product.openedAt);
    final expiresAt = DateTime(product.openedAt.year, product.openedAt.month + product.pAoMonths, product.openedAt.day);
    final expiresStr = DateFormat.yMMMMEEEEd(localeTag).format(expiresAt);

    final symbol = (appState.locale.languageCode == 'ru') ? '₸' : r'$';
    final priceStr = NumberFormat.currency(locale: localeTag, symbol: symbol).format(product.price);

    final selected = (tab == 'routine') ? 1 : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('${product.brand} • ${product.name}'),
        actions: [
          IconButton(
            tooltip: strings.localeToggle,
            onPressed: appState.toggleLocale,
            icon: const Icon(Icons.language),
          ),
          IconButton(
            tooltip: strings.settings,
            onPressed: () => context.go('/settings?tab=locale'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => const AspectRatio(
                aspectRatio: 16 / 10,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (_, __, ___) => const AspectRatio(
                aspectRatio: 16 / 10,
                child: Center(child: Icon(Icons.broken_image, size: 40)),
              ),
            ),
          ),
          const SizedBox(height: 16),

          SegmentedButton<int>(
            segments: [
              ButtonSegment(value: 0, label: Text(strings.tabInfo)),
              ButtonSegment(value: 1, label: Text(strings.tabRoutine)),
            ],
            selected: {selected},
            onSelectionChanged: (set) {
              final v = set.first;
              final newTab = (v == 1) ? 'routine' : 'info';
              context.go('/product/$id?tab=$newTab');
            },
          ),

          const SizedBox(height: 16),

          if (selected == 0) ...[
            Text(product.category, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text('${strings.openedAt}: $openedStr'),
            Text('${strings.expiresAt}: $expiresStr'),
            Text('${strings.price}: $priceStr'),
            const SizedBox(height: 16),
            Text('DTO -> toJson():\n${product.toJson()}'),
          ] else ...[
            Text(
              appState.locale.languageCode == 'ru'
                  ? 'Совет: добавь средство в утро/вечер на экране Рутина.'
                  : 'Tip: add this product to morning/evening on Routine screen.',
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {
                final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
                context.go('/routine/morning?date=$today');
              },
              icon: const Icon(Icons.checklist),
              label: Text(appState.locale.languageCode == 'ru' ? 'Открыть утро' : 'Open morning'),
            ),
          ],
        ],
      ),
    );
  }
}