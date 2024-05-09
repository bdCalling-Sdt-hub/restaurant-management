import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_management/utils/app_utils.dart';
import 'package:restaurant_management/view/widgets/custom_loading.dart';
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
  final restaurantId = Get.arguments;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("==================New Rating ====> >$restaurantId");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: "Review",fontSize: 18,fontWeight: FontWeight.w600,),
      ),
          body: GetBuilder<ReviewController>(
            builder: (controller) {
              return Column(
                  children: [

                    const SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16,),
                          RatingBar.builder(
                              itemBuilder: (context,_){
                            return const Icon(Icons.star_rate_outlined,color: Colors.amber,);
                          }, onRatingUpdate:(rating){
                                newRating = rating.toString();
                            print(newRating);
                          },
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,

                          ),

                          const SizedBox(height: 32,),
                          Form(
                            key: formKey,
                            child: TextFormField(
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackNormal
                            ),
                            maxLines: 3,
                            controller: controller.commentController,
                            validator: (v){
                              if(v.toString().isEmpty){
                                return "Please give you valuable rating";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Give your review here........",
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
                          ),),
                          const SizedBox(height: 14,),
                         controller.isLoading?const CustomElevatedLoadingButton(): CustomElevatedButton(
                            buttonHeight: 50,
                            buttonWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                              controller.sentReview(newRating,restaurantId);
                              }
                              if(newRating.isEmpty){
                               Utils.toastMessage("Please give your valuable rating");
                              }

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
