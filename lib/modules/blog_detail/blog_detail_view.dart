import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/get_images.dart';
import 'package:my_widgets/widgets/txt.dart';
import '../../main.dart';
import '../../s.dart';
import '../model/top_heading_model.dart';
import 'blog_detail_logic.dart';

class BlogDetailView extends StatelessWidget {
  final TopHeadlinesModel? blogData;
  const BlogDetailView({this.blogData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogDetailLogic>(
        init: BlogDetailLogic(),
        builder: (logic){
      return Material(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
           leading: Padding(
             padding: const EdgeInsets.all(8.0),
             child: CircleAvatar(backgroundColor: Colors.black.withOpacity(0.3) ,child: const BackButton(color: Colors.white,)),
           ),
          centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              GetImage(
                imagePath: blogData?.urlToImage??'',
                width: deviceWidth,
                height: deviceHeight* 0.7,
                fit: BoxFit.cover,
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
                    Txt('${blogData?.title}',hasBold: true,fontSize: 16,),
                    const MyDivider(),
                     Txt('${blogData?.description}'),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
