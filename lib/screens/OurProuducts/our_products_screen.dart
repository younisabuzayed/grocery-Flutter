import 'package:flutter/material.dart';
import '../Home/widgets/feed_items.dart';
import '../../services/utils.dart';
import '../../widgets/text_widget.dart';

class OurProducts extends StatefulWidget {
  static const routeName = "/our-products-screen";

  const OurProducts({super.key});

  @override
  State<OurProducts> createState() => _OurProductsState();
}

class _OurProductsState extends State<OurProducts> {
  final TextEditingController? _searchController = TextEditingController(); 
  final FocusNode _searchTextFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _searchController!.dispose();
    _searchTextFocusNode.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    return Scaffold(
      appBar: AppBar(
          title: TextWidget(
            text: 'Products',
            color: utils.color,
            textSize: 22,
            isTitle: true,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: utils.color,
          elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  focusNode: _searchTextFocusNode,
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Products',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: utils.color,
                        width: 1
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: utils.color,
                        width: 1
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        _searchController!.clear();
                        _searchTextFocusNode.unfocus();
                      },
                      icon: Icon(
                        Icons.close, 
                        color: _searchTextFocusNode.hasFocus 
                          ? Colors.red
                          : utils.color,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.center,
                    )
                  ),
                  maxLines: 1,
                  onChanged: (value) {
                    setState(() {
                      
                    });
                  },
                ),
              ),
              GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  childAspectRatio: utils.width /( utils.height * 0.60),
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7,
                  crossAxisCount: 2,
                  children: List.generate(16, (index) => FeedItems()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
