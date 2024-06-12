import 'package:awekon/components/ui_components/Category%20list/Views/CategoryList.dart';
import 'package:awekon/components/ui_components/Collections%20of%20you%20Horizontal%20Scroll/Views/HorizontalBookListCollection.dart';
import 'package:awekon/components/ui_components/New%20Story%20Horizontal%20Scroll/Views/HorizontalBookListNew.dart';
import 'package:awekon/components/ui_components/Popular%20story%20Horizontal%20Scroll/Views/HorizontalBookListPopular.dart';
import 'package:awekon/components/ui_components/Search%20Bar/Views/search_bar.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
            Center(
                child: CustomSearchBar(
                    controller: searchController,
                    hint: 'Title, author, host, or topic')),
            SizedBox(height: 0.03 * MediaQuery.of(context).size.height),
            const CategoryList(),
            SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
            const Divider(
              color: Colors.white54,
            ),
            const HorizontalBookListNew(),
            const Divider(
              color: Colors.white54,
            ),
            const HorizontalBookListPopular(),
            const Divider(
              color: Colors.white54,
            ),
            const HorizontalBookListCollection(),
            const Divider(
              color: Colors.white54,
            )
          ],
        ),
      ),
    );
  }
}
