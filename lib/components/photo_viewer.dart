import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import "../model/index.dart";
import "dart:convert";

class PhotoViewer extends StatefulWidget {
  List<PhotoObj> photoList;
  int? initialIndex;
  String? title;

  PhotoViewer({Key? key, required this.photoList, this.initialIndex}) : super(key: key);

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Container(
          child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        pageController: _pageController,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: MemoryImage(base64Decode(widget.photoList[index].base64!)),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            //heroAttributes: PhotoViewHeroAttributes(tag: widget.photoList[index].),
            //heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
          );
        },
        itemCount: widget.photoList.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1)),
          ),
        ),
        //backgroundDecoration: widget.backgroundDecoration,
        //pageController: widget.pageController,
        //onPageChanged: onPageChanged,
      )),
    );
  }
}
