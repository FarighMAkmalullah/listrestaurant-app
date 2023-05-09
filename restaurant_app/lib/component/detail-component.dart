import 'dart:math';
import 'package:restaurant_app/models/model-detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/screen/review-page.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/stores/restaurant.dart';

class DetailComponent extends StatefulWidget {
  final String id;
  const DetailComponent({super.key, required this.id});

  @override
  State<DetailComponent> createState() => _DetailComponentState();
}

class _DetailComponentState extends State<DetailComponent> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () {
  //     Provider.of<RestaurantProvider>(context, listen: false)
  //         .fetchRestaurantDetail(widget.id)
  //         .then((_) {
  //       setState(() {});
  //     }).catchError((error) {
  //       print(error.toString());
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text('Error memuat Detail Restaurant'),
  //             content: const Text(
  //                 'Gagal untuk memuat detail silahkan untuk mencoba lagi'),
  //             actions: [
  //               TextButton(
  //                 child: const Text('OK'),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, provider, _) {
      final restaurantDetail = provider.restaurantDetail;
      if (restaurantDetail != null) {
        return ListView(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            child: Image.network(
                "https://restaurant-api.dicoding.dev/images/medium/${restaurantDetail.pictureId}",
                fit: BoxFit.fitWidth),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(
                  restaurantDetail.name,
                  style: GoogleFonts.castoro(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${restaurantDetail.city} ${restaurantDetail.address}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 15,
                          color: Colors.red[300],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          restaurantDetail.categories[0].name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${restaurantDetail.rating}",
                          style: GoogleFonts.castoro(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ReviewPage(
                                customerReviews:
                                    restaurantDetail.customerReviews)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // warna teks
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // radius sudut tombol
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Icon(Icons.reviews),
                            SizedBox(
                              width: 7,
                            ),
                            Text("Reviews"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "\n     ${restaurantDetail.description}",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.black45,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(10),
                  child: buildListFoods(restaurantDetail),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: buildListDrink(restaurantDetail),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        ]);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget buildListFoods(RestaurantDetailModel restaurantDetail) {
    int? lengthFoods = restaurantDetail.menus.foods.length;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Foods",
              style: GoogleFonts.castoro(
                  fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.add)
          ],
        ),
        const Divider(
          thickness: 2,
          color: Colors.black12,
          height: 10,
        ),
        ListView.builder(
          itemCount: lengthFoods,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${restaurantDetail.menus.foods[index].name}",
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  const Icon(
                    Icons.fastfood,
                    color: Colors.black45,
                  ),
                ],
              ),
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        )
      ],
    );
  }

  Widget buildListDrink(RestaurantDetailModel restaurantDetail) {
    int? lengthFoods = restaurantDetail.menus.drinks.length;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Drinks",
              style: GoogleFonts.castoro(
                  fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.add)
          ],
        ),
        const Divider(
          thickness: 2,
          color: Colors.black12,
          height: 10,
        ),
        ListView.builder(
          itemCount: lengthFoods,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${restaurantDetail.menus.drinks[index].name}",
                    style: const TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  const Icon(
                    Icons.local_drink,
                    color: Colors.black45,
                  ),
                ],
              ),
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        )
      ],
    );
  }
}
