import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/screen/datail-restaurant.dart';
import 'package:restaurant_app/stores/restaurant.dart';
import 'package:restaurant_app/models/model.dart';

class HomepageList extends StatefulWidget {
  const HomepageList({super.key});

  @override
  State<HomepageList> createState() => _HomepageListState();
}

class _HomepageListState extends State<HomepageList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<RestaurantProvider>(context).fetchRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else {
          return Consumer<RestaurantProvider>(builder: (context, provider, _) {
            final restaurants = provider.restaurants;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      width: 230,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " List Restourants",
                            style: GoogleFonts.castoro(
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Divider(
                            thickness: 2,
                            color: Colors.black12,
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: buildListRestaurant(restaurants),
                    ),
                  ],
                ),
              ),
            );
          });
        }
      },
    );
  }

  //List Restaurant
  Widget buildListRestaurant(List<RestaurantModel> restaurants) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<RestaurantProvider>(context, listen: false)
                          .fetchRestaurantDetail(restaurant.id)
                          .then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailRestaurant(id: restaurant.id),
                          ),
                        );
                      });
                    },
                    child: Image.network(
                        "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}",
                        fit: BoxFit.fitWidth),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.restaurant_sharp,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          restaurant.city,
                          style: const TextStyle(color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.black12,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        Text(
                          "${restaurant.rating}  (205)",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.lock_clock_outlined,
                          color: Colors.black45,
                        ),
                        Text(
                          "30 - 45 Mins",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.black45,
                        ),
                        Text(
                          "Free",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
