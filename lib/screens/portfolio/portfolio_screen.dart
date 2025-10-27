import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_colors.dart';
import '../../data/dummy_data.dart';
import 'portfolio_tab.dart';
import 'widgets/portfolio_card.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.h),
        child: AppBar(
          backgroundColor: const Color.fromARGB(28, 255, 255, 255),
          title: Text('Portfolio', style: AppTextStyles.heading),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                children: [
                  Icon(Icons.shopping_bag, color: AppColors.primary, size: 30.r),
                  SizedBox(width: 16.w),
                  Icon(Icons.notifications, color: AppColors.primary, size: 30.r),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        onPressed: () {},
        child: Container(
          width: 56.r,
          height: 56.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
           
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.gray,
                indicatorColor: AppColors.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: "Project"),
                  Tab(text: "Saved"),
                  Tab(text: "Shared"),
                  Tab(text: "Achievement"),
                ],
              ),
              Divider(height: 7.h, color: Colors.grey),
              Expanded(
                child: TabBarView(
                  children: [
                    // Only Project tab has search
                    _buildProjectTab(),
                    const PortfolioTab(showData: false),
                    const PortfolioTab(showData: false),
                    const PortfolioTab(showData: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectTab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                leading: const Icon(Icons.search),
                hintText: "Search a project",
                controller: controller,
                onTap: () => controller.openView(),
                onChanged: (_) => controller.openView(),
                elevation: WidgetStateProperty.all(1),
                backgroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              );
            },
            suggestionsBuilder: (context, controller) {
              final query = controller.text.toLowerCase();
              final results = dummyProjects.where(
                (p) => p.title.toLowerCase().contains(query),
              );

              if (results.isEmpty) {
                return [
                  ListTile(
                    title: Text('No results found'),
                    enabled: false,
                  )
                ];
              }

              return results.map((p) {
                return ListTile(
                  title: Text(p.title),
                  subtitle: Text("${p.language} • ${p.subject}"),
                  onTap: () {
                    controller.closeView(p.title);
                  },
                );
              }).toList();
            },
          ),
        ),
        const Expanded(
          child: PortfolioTab(showData: true),
        ),
      ],
    );
  }
}
