import 'package:bookstore/config/routes/routes_name.dart';
import 'package:bookstore/res/types_of_books.dart';
import 'package:bookstore/view/widgets/books_list_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Set the number of tabs here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Icon(Icons.person),
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: ElevatedButton(
                child: const Text("Account"),
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.account);
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [Icon(Icons.search)],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Book'),
            Tab(text: 'AudioBook'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 // Render BooksListWidget for each type of book
                for (var type in typeOfBooks) BooksListWidget(name: type, index: 0),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RoutesName.dataList);
                    },
                    child: const Icon(Icons.card_giftcard_rounded)),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Text("Daassd"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
