import 'package:flutter/material.dart';
import 'package:myapp/common/utils/utils.dart';
import 'package:myapp/common/values/values.dart';
import 'package:myapp/common/widgets/widgets.dart';
import 'package:myapp/pages/Create/creates.dart';
import 'package:myapp/pages/Manage/manages.dart';
import 'package:myapp/pages/account/account.dart';
import 'package:myapp/pages/main/main.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码
  int _page = 0;
  // tab 页标题
  final List<String> _tabTitles = ['Welcome', 'Manage', 'Create', 'Account'];
  // 页控制器
  PageController? _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.home,
        color: AppColors.secondaryElementText,
      ),
      label: 'main',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.grid_on,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.grid_on,
        color: AppColors.secondaryElementText,
      ),
      label: 'manage',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.add_circle_outline,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.add_circle_outline,
        color: AppColors.secondaryElementText,
      ),
      label: 'create',
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Icons.account_circle,
        color: AppColors.secondaryElementText,
      ),
      label: 'my',
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController!.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  // 顶部导航
  PreferredSizeWidget _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        ManagePage(),
        CreatesPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
