import 'package:flutter/material.dart';
import 'package:restaurant_app/component/review-component.dart';
import 'package:restaurant_app/models/model-detail.dart';

class ReviewPage extends StatefulWidget {
  final List<CustomerReview> customerReviews;

  const ReviewPage({Key? key, required this.customerReviews}) : super(key: key);
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Review & Ratings",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ReviewComponent(review: widget.customerReviews),
    );
  }
}
