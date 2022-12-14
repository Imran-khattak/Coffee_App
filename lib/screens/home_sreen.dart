import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_app/widgets/items_widget.dart';

import '../widgets/home_bottom_nav.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);
  @override
  State<HomeSreen> createState() => HomeSreenState();
}

class HomeSreenState extends State<HomeSreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.sort_rounded,
                        color: Colors.black,
                        size: 35,
                      )),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.notifications_active,
                        color: Colors.black,
                        size: 35,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Its a Great Day for Coffee',
                style: GoogleFonts.pattaya(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff7A3E26)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xff7A3E26),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Find Your Coffee',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xff7A3E26),
                    )),
              ),
            ),
            TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                isScrollable: true,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xff7A3E26),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16)),
                labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: const [
                  Tab(
                    text: 'Hot Coffee',
                  ),
                  Tab(
                    text: 'Cold Coffee',
                  ),
                  Tab(
                    text: 'Cappuiccino',
                  ),
                  Tab(
                    text: 'Americano',
                  ),
                ]),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: const [
                ItemsWidget(),
                ItemsWidget(),
                ItemsWidget(),
                ItemsWidget(),
                //  ItemsWidget(),
              ][_tabController.index],
            )
          ],
        ),
      )),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
