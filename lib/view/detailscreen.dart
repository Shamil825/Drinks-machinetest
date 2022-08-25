import 'package:flutter/material.dart';
import 'package:user_authetication/model/model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.drinks}) : super(key: key);
  final Drinks drinks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Details"), backgroundColor: Colors.brown,),
      body: SafeArea(
          child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: drinks.idDrink!,
                  child: SizedBox(
                      height: 350,
                      width: 350,
                      child: Image.network(drinks.strDrinkThumb!))),
          const    SizedBox(
                height: 10,
              ),
              Stack(
                children: <Widget>[
                  Text(
                    drinks.strDrink!,
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.green[700]!,
                    ),
                  ),
                  Text(
                    drinks.strDrink!,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            const  SizedBox(
                width: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "-${drinks.strCategory!}",
                    style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(" -${drinks.strAlcoholic!}",
                      style:
                       const  TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
           const   SizedBox(
                height: 6,
              ),
              Text(" -${drinks.strGlass!}",
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const  SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(" ${drinks.strInstructions!}",
                    textAlign: TextAlign.center,
                    style:const TextStyle(fontSize: 20)),
              ),
             const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
