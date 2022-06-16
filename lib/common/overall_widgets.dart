import 'package:coctails/common/app_theme.dart';
import 'package:coctails/data/coctails_responce/coctails/drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../features/detail_screen/detail_screen_page.dart';
import '../features/favorites/favorites.dart';

class AppBarManager {
  static AppBar mainAppBar(String title, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white38,
      shadowColor: Colors.transparent,
      title: Text(title),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (
                    context,
                  ) =>
                      Favorites(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.black45,
            )),
        const ChangeThemeButtonWidget(),
      ],
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        const Text('Turn light off', style: TextStyle(fontSize: 15)),
        Switch.adaptive(
          value: themeProvider.isDarkMode,
          onChanged: (value) {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(value);
          },
        ),
      ],
    );
  }
}

class CustomListWiew extends StatelessWidget {
  final int itemCount;
  final List<Drink> drinks;
  const CustomListWiew(
      {Key? key, required this.drinks, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 800),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: -300,
                verticalOffset: -850,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    margin: const EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 0.0),
                    child: ListTile(
                      visualDensity: VisualDensity.compact,
                      dense: true,
                      title: Text('${drinks[index].strDrink}'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (
                              context,
                            ) =>
                                DetailScreenPage(
                              drink: drinks[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
