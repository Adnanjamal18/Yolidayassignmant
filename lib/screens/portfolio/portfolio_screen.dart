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
          elevation: 0,
          title: Text(
            'Portfolio',
            style: AppTextStyles.heading.copyWith(fontSize: 20.sp),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                children: [
                  Icon(Icons.shopping_bag, color: AppColors.primary, size: 26.r),
                  SizedBox(width: 16.w),
                  Icon(Icons.notifications, color: AppColors.primary, size: 26.r),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
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
            image: const DecorationImage(
              image: AssetImage('assets/icons/Group22.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Main Body
      body: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tab Bar
              TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.gray,
                labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                unselectedLabelStyle: TextStyle(fontSize: 14.sp),
                indicatorColor: AppColors.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: "Project"),
                  Tab(text: "Saved"),
                  Tab(text: "Shared"),
                  Tab(text: "Achievement"),
                ],
              ),

              Divider(height: 6.h, color: Colors.grey.shade300),

              // Tab Content
              Expanded(
                child: TabBarView(
                  children: [
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

  /// Project Tab (with Search)
    Widget _buildProjectTab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                trailing: [
  Container(
    width: 32.w,
    height: 32.w,
    decoration: BoxDecoration(
      color: AppColors.primary, // background color
    //  border:  // makes it round
    borderRadius: BorderRadius.circular(12.r)
    ),
    child: Icon(
      Icons.search,
      size: 20.r,
      color: AppColors.white, // icon color
    ),
  ),
],

                hintText: "Search a project",
                hintStyle: WidgetStateProperty.all(
                  TextStyle(fontSize: 14.sp, color: AppColors.gray),
                ),
                controller: controller,
                onTap: () => controller.openView(),
                onChanged: (_) => controller.openView(),
                elevation: WidgetStateProperty.all(1),
                backgroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side: BorderSide(color: Colors.grey.shade300, width: 1.w),
                  ),
                ),
                // 🔹 Reduced height (vertical padding smaller)
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
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
                    title: Text(
                      'No results found',
                      style: TextStyle(fontSize: 14.sp, color: AppColors.gray),
                    ),
                    enabled: false,
                  )
                ];
              }

              return results.map((p) {
                return ListTile(
                  title: Text(
                    p.title,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    "${p.language} • ${p.subject}",
                    style: TextStyle(fontSize: 12.sp, color: AppColors.gray),
                  ),
                  onTap: () {
                    controller.closeView(p.title);
                  },
                );
              }).toList();
            },
          ),
        ),

        // Portfolio List
        const Expanded(
          child: PortfolioTab(showData: true),
        ),
      ],
    );
  }

}

