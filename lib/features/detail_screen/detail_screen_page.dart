import 'package:coctails/common/variables.dart';
import 'package:coctails/features/favorites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../common/overall_widgets.dart';
import '../../data/coctails_responce/coctails/drink.dart';

class DetailScreenPage extends StatelessWidget {
  const DetailScreenPage({Key? key, required this.drink}) : super(key: key);

  final Drink drink;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarManager.mainAppBar('${drink.strDrink}', context),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Card(
                  borderOnForeground: false,
                  elevation: 20,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image(
                      image: CachedNetworkImageProvider(drink.strDrinkThumb!)),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '${drink.strDrink}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '${drink.strCategory}',
                ),
              ),
              const Text(
                'Рецепт:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${drink.strInstructions}',
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                color: Colors.white54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  Variables.drinks.add(drink);
                  popUp(context, drink.strDrink.toString());
                },
                minWidth: double.infinity,
                child: const Text('Добавить в избранное'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future popUp(BuildContext context, String nameOfCoctail) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        content: Container(
          child: Text(
            'Коктейль $nameOfCoctail добавлен в Избранное',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          MaterialButton(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
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
            child: const Text(
              'В избранное',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      );
    },
  );
}
