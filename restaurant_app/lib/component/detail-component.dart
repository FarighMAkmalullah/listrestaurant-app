import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailComponent extends StatefulWidget {
  const DetailComponent({super.key});

  @override
  State<DetailComponent> createState() => _DetailComponentState();
}

class _DetailComponentState extends State<DetailComponent> {
  Map<String, dynamic> data = {
    "restaurant": {
      "id": "rqdv5juczeskfw1e867",
      "name": "Melting Pot",
      "description":
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
      "city": "Medan",
      "address": "Jln. Pandeglang no 19",
      "pictureId": "14",
      "categories": [
        {"name": "Italia"},
        {"name": "Modern"}
      ],
      "menus": {
        "foods": [
          {"name": "Paket rosemary"},
          {"name": "Toastie salmon"},
          {"name": "Bebek crepes"},
          {"name": "Salad lengkeng"}
        ],
        "drinks": [
          {"name": "Es krim"},
          {"name": "Sirup"},
          {"name": "Jus apel"},
          {"name": "Jus jeruk"},
          {"name": "Coklat panas"},
          {"name": "Air"},
          {"name": "Es kopi"},
          {"name": "Jus alpukat"},
          {"name": "Jus mangga"},
          {"name": "Teh manis"},
          {"name": "Kopi espresso"},
          {"name": "Minuman soda"},
          {"name": "Jus tomat"}
        ]
      },
      "rating": 4.2,
      "customerReviews": [
        {
          "name": "Ahmad",
          "review": "Tidak rekomendasi untuk pelajar!",
          "date": "13 November 2019"
        }
      ]
    }
  };
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Image.network(
            "https://restaurant-api.dicoding.dev/images/medium/${data["restaurant"]?["pictureId"]}",
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
              data["restaurant"]?["name"] as String,
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
                  "${data["restaurant"]?["city"]}, ${data["restaurant"]?["address"]}",
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
                      (data["restaurant"]?["categories"] as List<dynamic>)[0]
                          ["name"],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
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
                      (data["restaurant"]?["categories"] as List<dynamic>)[1]
                          ["name"],
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[300],
                      ),
                    ),
                  ],
                )
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
                      "${data["restaurant"]!["rating"]}",
                      style: GoogleFonts.castoro(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // warna teks
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25.0), // radius sudut tombol
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
              "\n     ${data["restaurant"]?["description"]}",
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black45,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.all(10),
              child: buildListFoods(context),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: buildListDrink(context),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      )
    ]);
  }
  Widget buildListFoods(BuildContext context) {
    int? lengthFoods = data['restaurant']?['menus']?['foods']?.length;
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
                    "${data['restaurant']['menus']['foods'][index]['name']}",
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

  Widget buildListDrink(BuildContext context) {
    int? lengthFoods = data['restaurant']?['menus']?['drinks']?.length;
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
                    "${data['restaurant']['menus']['drinks'][index]['name']}",
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
