import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import 'widgets/portfolio_card.dart';

class PortfolioTab extends StatelessWidget {
  final bool showData;
  const PortfolioTab({super.key, required this.showData});

  @override
  Widget build(BuildContext context) {
    if (!showData) {
      return const Center(child: Text('Empty'));
    }
    return ListView.builder(
      itemCount: dummyProjects.length,
      itemBuilder: (context, index) {
        return PortfolioCard(item: dummyProjects[index]);
      },
    );
  }
}
