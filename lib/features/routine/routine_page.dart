import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app_state.dart';
import '../../l10n/app_strings.dart';
import '../products/product_repository.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({
    super.key,
    required this.appState,
    required this.type,
    required this.dateIso,
  });

  final AppState appState;
  final String type; // morning | evening
  final String? dateIso;

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  final repo = ProductRepository();
  final done = <int>{};

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(widget.appState.locale);
    final localeTag = widget.appState.locale.toLanguageTag();

    final isMorning = widget.type == 'morning';
    final title = isMorning ? strings.morning : strings.evening;

    final date = widget.dateIso != null
        ? DateTime.tryParse(widget.dateIso!)
        : DateTime.now();

    final dateStr = DateFormat.yMMMMd(localeTag).format(date ?? DateTime.now());

    final steps = repo.getRoutineSteps(widget.type);
    final products = repo.getProducts();
    final byId = {for (final p in products) p.id: p};

    return Scaffold(
      appBar: AppBar(
        title: Text('${strings.routine}: $title • $dateStr'),
        actions: [
          IconButton(
            tooltip: strings.localeToggle,
            onPressed: widget.appState.toggleLocale,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: steps.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final s = steps[i];
          final p = byId[s.productId];

          final checked = done.contains(s.id);

          return ListTile(
            leading: p == null
                ? const SizedBox(width: 56, height: 56, child: Icon(Icons.help_outline))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: p.imageUrl,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => const SizedBox(
                        width: 56,
                        height: 56,
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      ),
                      errorWidget: (_, __, ___) => const SizedBox(
                        width: 56,
                        height: 56,
                        child: Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
                  ),
            title: Text(s.stepType),
            subtitle: Text(p == null ? 'productId=${s.productId}' : '${p.brand} • ${p.name}'),
            trailing: Checkbox(
              value: checked,
              onChanged: (_) {
                setState(() {
                  if (checked) {
                    done.remove(s.id);
                  } else {
                    done.add(s.id);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}