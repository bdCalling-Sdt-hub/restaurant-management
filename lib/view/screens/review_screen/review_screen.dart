import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_management/view/widgets/custom_text.dart';

import '../../../controller/rating_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/elevated_button.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  String newRating = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Review"),
      ),
          body: GetBuilder<ReviewController>(
            builder: (controller) {
              return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal:  16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Review"),

                        ],
                      ),
                    ),
                    const SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          const CustomText(
                            text: "title",
                            color: AppColors.blackNormal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          const SizedBox(height: 16,),
                          RatingBar.builder(
                              itemBuilder: (context,_){
                            return const Icon(Icons.star_rate_outlined,color: Colors.amber,);
                          }, onRatingUpdate:(rating){

                                newRating = rating.toString();
                            print(newRating);
                          },
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,

                          ),

                          const SizedBox(height: 32,),
                          TextFormField(
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackNormal
                            ),
                            maxLines: 3,
                            decoration: InputDecoration(
                                hintText: "give your review here........",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:  const BorderSide(
                                      color: AppColors.greenNormal,

                                    )
                                ),
                                focusedBorder:  const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenNormal,

                                    )
                                )
                            ),
                          ),
                          const SizedBox(height: 14,),
                          CustomElevatedButton(
                            buttonHeight: 50,
                            buttonWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                             // controller.sentReview(newRating);
                            },
                            titleText: "Send review",
                            titleSize: 18,
                            titleWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    )

                  ]
              );
            }
          ),
    );
  }
}
