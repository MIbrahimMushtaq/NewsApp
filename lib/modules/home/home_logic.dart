import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import '../blog_detail/blog_detail_view.dart';
import 'home_modal.dart';

class HomeLogic extends GetxController{
  
  List<HomeModal> listBlogs =[
    HomeModal('https://www.travels-blog.com/wp-content/uploads/2022/09/Nathia-Gali.jpg', 'Nathia Gali, A Place To Visit'),
    HomeModal('https://res.cloudinary.com/www-travelpakistani-com/image/upload/v1661156617/Attabad_Lake_travelpakistani.webp', 'Attabad Lake Hunza Valley'),
    HomeModal('https://rozefstourism.com/wp-content/uploads/2021/03/Passu-Cones-3.png', 'Passu Cones,Karakoram Highway view'),
  ] ;


  void onBlogTap(HomeModal item) {
    pSetRout(page: ()=>BlogDetailView(blogData: item,));
  }

  void onIconTap(HomeModal item) {
    pSetRout(page: ()=>BlogDetailView(blogData: item,));
  }
}