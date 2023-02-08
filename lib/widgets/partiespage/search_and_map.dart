import 'package:flutter/material.dart';

import '/utils/theming.dart';

class SearchAndMap extends StatefulWidget {
  const SearchAndMap({super.key});

  @override
  State<SearchAndMap> createState() => _SearchAndMapState();
}

class _SearchAndMapState extends State<SearchAndMap> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75 + MediaQuery.of(context).padding.top,
      width: MediaQuery.of(context).size.width - 30 * 2,
      decoration: const BoxDecoration(
        color: Theming.bgColor,
      ),
      child: Column(
        children: [
          //Searchbar and add party button
          Row(
            children: [
              //Map button
              GestureDetector(
                onTap: () {
                  //! Dodawanie imprezy
                },
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Theming.whiteTone.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.location_on_outlined,
                    size: 32,
                    color: Theming.primaryColor,
                  ),
                ),
              ),

              const Spacer(),

              //Search bar
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width - 55 - 60 - 20,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theming.whiteTone,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  cursorColor: Theming.primaryColor,
                  style: TextStyle(fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                    hintText: "Gdzie szukasz imprezy?",
                    hintStyle: Styles.hintTextSearchBar,
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Theming.primaryColor,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          //Category roll
          Row(
            children: [
              _categoryItem(0, caption: "W okolicy"),
              _categoryItem(1, caption: "Znajomi"),
              _categoryItem(2, caption: "Losowe"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _categoryItem(
    int index, {
    required String caption,
  }) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? Theming.primaryColor.withOpacity(0.5)
              : Theming.whiteTone.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          caption,
          style: const TextStyle(
            color: Theming.whiteTone,
          ),
        ),
      ),
    );
  }
}
