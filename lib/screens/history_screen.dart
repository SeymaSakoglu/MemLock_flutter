import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geçmiş'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Text('Sırala:',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: const Text('En Yeni'),
                      selected: true,
                      onSelected: (_) {},
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: const Text('Fiyat'),
                      selected: false,
                      onSelected: (_) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            child: Image.asset(
                              "assets/images/urun1.webp",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: const Icon(Icons.favorite_border),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ürün ${index + 1}',
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '₺${(index + 1) * 100}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart, size: 18),
                            label: const Text('Sepete Ekle'),
                            style: FilledButton.styleFrom(
                              minimumSize: const Size(double.infinity, 36),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Filtrele'),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fiyat Aralığı',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Min',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Max',
                      prefixText: '₺',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Kategoriler',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: const Text('Elektronik'),
                  selected: true,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: const Text('Moda'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: const Text('Ev'),
                  selected: false,
                  onSelected: (_) {},
                ),
                FilterChip(
                  label: const Text('Spor'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Arama',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Ürün ara...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Temizle'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Uygula'),
          ),
        ],
      ),
    );
  }
}