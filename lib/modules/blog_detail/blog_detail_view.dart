import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/get_images.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../main.dart';
import '../../s.dart';
import '../home/home_modal.dart';
import 'blog_detail_logic.dart';

class BlogDetailView extends StatelessWidget {
  final HomeModal? blogData;
  const BlogDetailView({this.blogData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogDetailLogic>(
        init: BlogDetailLogic(),
        builder: (logic){
      return Material(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(title: const Txt('Blog Detail',hasBold:true,textColor: Colors.white,),
          centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
             Container(
                height: deviceHeight*0.7,
                width: double.infinity,
                decoration: pBoxDecoration(
                  color: Clr.primaryColor,
                  image: blogData?.backgroundImage??'',
                  isAsset: false,
                  fit: BoxFit.cover,
                  radius: 0,
                ),
               child: Padding(
                 padding: EdgeInsets.only(top: deviceHeight * 0.3),
                 child: SizedBox(
                   height: deviceHeight * 0.8,
                   child: Txt(blogData?.blogTitle,fontSize: 20,textColor: Colors.white,textAlign: TextAlign.center),
                 ),
               ),
              ),
              buildBottomSheet(),
            ],
          ),
        ),
      );
    });
  }

  buildBottomSheet(){
    return DraggableScrollableSheet(
      maxChildSize: 0.7,
      minChildSize: 0.4,
      initialChildSize: 0.4,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Siz.standMargin),topRight:Radius.circular(Siz.standMargin))
            ),
            child:SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Siz.standPadding *1.5),
                child: Column(
                  children: [
                    Container(width: 60,height: 2,color: Clr.primaryColor,),
                    const MyDivider(),
                    const Txt('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                    const MyDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Txt('More Images',hasBold: true,),
                        Txt('View all',hasUnderLine: true,textColor: Clr.primaryColor,),

                      ],
                    ),
                    const MyDivider(),
                    SizedBox(
                      height: deviceHeight * 0.12,
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx,int index){
                        return Container(
                          height:deviceHeight * 0.12,
                          width: deviceWidth * 0.3,
                          margin: const EdgeInsets.only(right: 12.0),
                          child: GetImage(imagePath: blogData?.backgroundImage,fit: BoxFit.cover,isAssets: false,),
                        );
                      }),
                    ),
                    const MyDivider(),
                    const Txt('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                    const Txt('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
