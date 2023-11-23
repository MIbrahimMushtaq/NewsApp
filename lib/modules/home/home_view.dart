import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/get_images.dart';
import 'package:my_widgets/widgets/txt.dart';
import '../../main.dart';
import '../../s.dart';
import 'home_logic.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
        init: HomeLogic(),
        builder:(logic){
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(Siz.standPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyDivider(),
                    Txt('Travel Blogs',hasBold: true,fontSize: Siz.titleLarge,textColor: Clr.primaryColor,),
                    const MyDivider(),
                    const MyDivider(),
                    SizedBox(
                      height: deviceHeight * 0.35,
                      child: ListView.builder(
                          itemCount: logic.listBlogs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx,index){
                            final item = logic.listBlogs[index];
                        return buildBlogHorizontalTile(bgImage:item.backgroundImage ,blogTitle:item.blogTitle,tileWidth: deviceWidth * 0.7 ,onTap:()=>logic.onIconTap(item) );
                      }),

                    ),
                    const MyDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Txt('Most Popular',hasBold: true,),
                        Txt('View All',hasUnderLine: true,textColor: Clr.primaryColor,),
                      ],
                    ),
                    const MyDivider(),
                    Expanded(child:  ListView.builder(
                        itemCount: logic.listBlogs.length,
                        itemBuilder: (ctx,index){
                          final item = logic.listBlogs[index];
                          return buildPopularBlogTile(blogTitle: item.blogTitle,blogImage: item.backgroundImage,onTap: ()=>logic.onBlogTap(item));
                        }))


                  ],
                ),
              ),
            )
          );
        } );
  }
  buildBlogHorizontalTile({String? bgImage,String? blogTitle,required double tileWidth,double? textSize,Function()? onTap}){
    return Stack(
      children: [
        Container(
          width: tileWidth,
          height: deviceHeight *0.32,
          margin: const EdgeInsets.only(right: 12),
          decoration: pBoxDecoration(
            borderRadius: BorderRadius.circular(Siz.standMargin),
          ),
          child: GetImage(
            height: deviceHeight *0.32,
            imagePath:bgImage,
            fit: BoxFit.cover,
            onTap: (){},
          ) ,
        ),
        Positioned(
            bottom: deviceHeight *0.1,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: deviceWidth *0.58,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(Siz.standMargin)
              ),
              child: Txt(blogTitle,hasBold: true,fontSize: textSize??20,maxLine: 3,textColor: Colors.white,overflow: TextOverflow.ellipsis,),

            )),
        Positioned(
            bottom: 0,
            right: 26,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                backgroundColor: Clr.primaryColor,
                child: const Icon(Icons.arrow_forward,color: Colors.white,),
              ),
            ))
      ],
    );
  }
  buildPopularBlogTile({String? blogImage, String? blogTitle,Function()? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: deviceHeight * 0.13,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(Siz.standPadding - 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Siz.standMargin),
          border: Border.all(color: Clr.primaryColor),
        ),
        child: Row(
          children: [
            GetImage(isAssets: false,imagePath: blogImage,width: deviceWidth*0.23,),
            const MyVerticalDivider(),
            Expanded(child: Txt(blogTitle,maxLine: 3,))

          ],
        ),

      ),
    );
  }
}
