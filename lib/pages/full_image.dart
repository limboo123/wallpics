import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FullImage extends StatefulWidget {
  String image;
  String alt;
  FullImage({super.key,required this.image,required this.alt});

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.alt,style: TextStyle(fontSize: 24,color: Colors.white),),
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(child: Image(image: NetworkImage(widget.image),height: MediaQuery.of(context).size.height*0.8,fit: BoxFit.cover,)),
    );
  }
}