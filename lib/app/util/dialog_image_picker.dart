import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ImagePickerDialog extends StatefulWidget {
  final bool? isVideo;

  const ImagePickerDialog({Key? key, this.isVideo}) : super(key: key);
  @override
  _ImagePickerDialogState createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.isVideo!? "Choose Video From" : "Choose Image From",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
               Get.back(result: "gallery");
              },
              child: const ListTile(
                title: Text("Gallery"),
                leading: Icon(Icons.image),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back(result: "camera");
              },
              child: const ListTile(
                title: Text("Camera"),
                leading: Icon(Icons.camera),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
