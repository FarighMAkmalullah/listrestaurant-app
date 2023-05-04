import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailComponent extends StatefulWidget {
  const DetailComponent({super.key});

  @override
  State<DetailComponent> createState() => _DetailComponentState();
}

class _DetailComponentState extends State<DetailComponent> {
  var data = {
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
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              data["restaurant"]?["name"] as String,
              style: GoogleFonts.castoro(
                fontSize: 22,
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                ),
                Text(
                    "${data["restaurant"]?["city"]}, ${data["restaurant"]?["address"]}")
              ],
            )
          ],
        ),
      )
    ]);
  }
}
