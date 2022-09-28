import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery/services/utils.dart';

class SwiperBox extends StatelessWidget {
  const SwiperBox({
    Key? key,
    required this.utils,
    required List<String> listImage,
  }) : _listImage = listImage, super(key: key);

  final Utils utils;
  final List<String> _listImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: utils.height * 0.3,
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network(_listImage[index],fit: BoxFit.fill,);
          },
          itemCount: _listImage.length,
          autoplay: true,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              activeColor: 
                utils.getTheme 
                  ? const Color.fromARGB(255, 110, 209, 255)
                  : Colors.black87,
              color: Colors.white
            )
          ),
        ),
    );
  }
}