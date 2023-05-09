import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/models/model-detail.dart';

class ReviewComponent extends StatefulWidget {
  final List<CustomerReview> review;
  ReviewComponent({super.key, required this.review});

  @override
  State<ReviewComponent> createState() => _ReviewComponentState();
}

class _ReviewComponentState extends State<ReviewComponent> {
  Map<String, dynamic> data = {
    "error": false,
    "message": "success",
    "restaurant": {
      "id": "w9pga3s2tubkfw1e867",
      "name": "Bring Your Phone Cafe",
      "description":
          "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
      "city": "Surabaya",
      "address": "Jln. Belimbing Timur no 27",
      "pictureId": "03",
      "categories": [
        {"name": "Modern"},
        {"name": "Italia"}
      ],
      "menus": {
        "foods": [
          {"name": "Salad lengkeng"},
          {"name": "Sosis squash dan mint"},
          {"name": "Toastie salmon"},
          {"name": "Salad yuzu"},
          {"name": "Matzo farfel"},
          {"name": "Kari terong"},
          {"name": "roket penne"},
          {"name": "Napolitana"},
          {"name": "Daging Sapi"},
          {"name": "Bebek crepes"},
          {"name": "Sup Kohlrabi"},
          {"name": "Ikan teri dan roti"},
          {"name": "Tumis leek"}
        ],
        "drinks": [
          {"name": "Kopi espresso"},
          {"name": "Coklat panas"},
          {"name": "Jus jeruk"},
          {"name": "Jus apel"},
          {"name": "Minuman soda"},
          {"name": "Air"},
          {"name": "Es kopi"}
        ]
      },
      "rating": 4.2,
      "customerReviews": [
        {
          "name": "Widdy",
          "review": "Tidak ada duanya!",
          "date": "13 Juli 2019"
        },
        {
          "name": "Ahmad",
          "review": "Tidak rekomendasi untuk pelajar!",
          "date": "13 November 2019"
        },
        {
          "name": "Gilang",
          "review": "Saya sangat suka menu malamnya!",
          "date": "13 Juli 2019"
        }
      ]
    }
  };
  @override
  Widget build(BuildContext context) {
    int? lengthReview = widget.review.length;
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: lengthReview,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 7,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.review[index].name,
                            style: GoogleFonts.castoro(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              // Icon(
                              //   Icons.star,
                              //   color: Colors.yellow[800],
                              // ),
                              Text(
                                widget.review[index].date,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        widget.review[index].review,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
