import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../l10n/app_strings.dart';
import 'product_repository.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key, required this.appState});

  final AppState appState;
  final repo = ProductRepository();

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(appState.locale);
    final localeTag = appState.locale.toLanguageTag();
    final products = repo.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.products),
        actions: [
          IconButton(
            tooltip: strings.localeToggle,
            onPressed: appState.toggleLocale,
            icon: const Icon(Icons.language),
          ),
          IconButton(
            tooltip: strings.routine,
            onPressed: () {
              final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
              context.go('/routine/morning?date=$today');
            },
            icon: const Icon(Icons.checklist),
          ),
          IconButton(
            tooltip: strings.settings,
            onPressed: () => context.go('/settings?tab=security'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final p = products[index];

          final openedStr = DateFormat.yMMMMd(localeTag).format(p.openedAt);

          // Валюта: по умолчанию ₸ / $
          final symbol = (appState.locale.languageCode == 'ru') ? '₸' : r'$';
          final priceStr = NumberFormat.currency(
            locale: localeTag,
            symbol: symbol,
          ).format(p.price);

          final expiresAt = DateTime(p.openedAt.year, p.openedAt.month + p.pAoMonths, p.openedAt.day);
          final expiresStr = DateFormat.yMMMMd(localeTag).format(expiresAt);
          final daysLeft = expiresAt.difference(DateTime.now()).inDays;

          final badge = daysLeft <= 30 ? (appState.locale.languageCode == 'ru' ? 'Скоро' : 'Soon') : null;

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: p.imageUrl,
                width: 58,
                height: 58,
                fit: BoxFit.cover,
                placeholder: (_, __) => const SizedBox(
                  width: 58,
                  height: 58,
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                errorWidget: (_, __, ___) => const SizedBox(
                  width: 58,
                  height: 58,
                  child: Center(child: Icon(Icons.broken_image)),
                ),
              ),
            ),
            title: Text('${p.brand} • ${p.name}'),
            subtitle: Text(
              '${strings.openedAt}: $openedStr\n${strings.expiresAt}: $expiresStr • ${strings.price}: $priceStr',
            ),
            isThreeLine: true,
            trailing: badge == null
                ? null
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: Text(badge),
                  ),
            onTap: () => context.go('/product/${p.id}?tab=info'),
          );
        },
      ),
    );
  }
}