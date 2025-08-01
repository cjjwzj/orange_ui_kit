import 'package:example/icons/orange_icons.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final log = Logger(runtimeType.toString());
  late TabController _tabController;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 在initState中创建
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Text(
              '🍊 Orange UI',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        leadingWidth: screenWidth * 0.75,
        title: TabBar(
          dividerHeight: 0,
          controller: _tabController,
          tabs: [
            Tab(
              text: '指南',
            ),
            Tab(
              text: '组件',
            ),
            Tab(
              text: '资源',
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            height: 0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.translate,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              OrangeIcons.icon_github,
            ),
          ),
          SizedBox(
            width: 24,
          ),
        ],
      ),
      body: widget.child,
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // 在dispose中释放
    super.dispose();
  }
}
