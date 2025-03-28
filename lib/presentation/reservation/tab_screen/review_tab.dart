import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_bloc.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_event.dart';
import 'package:reservation_system/bloc/review_restaurant/review_restaurant_state.dart';
import 'package:reservation_system/models/class/comment.dart';
import 'package:reservation_system/presentation/reservation/reservation_component/review_card.dart';

class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewRestaurantBloc()..add(FetchReviewRestaurant()),
      child: BlocBuilder<ReviewRestaurantBloc, ReviewRestaurantState>(
        builder: (context, state) {
          if (state is ReviewRestaurantLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FetchReviewRestaurantSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(children: [_BuildBody(comments: state.comments)]),
              ),
            );
          }
          return Center(
            child: Text('Something went wrong or no data available.'),
          );
        },
      ),
    );
  }
}

class _BuildBody extends StatelessWidget {
  final List<Comment> comments;
  const _BuildBody({required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return ReviewCard(comments: comments[index]);
      },
    );
  }
}
