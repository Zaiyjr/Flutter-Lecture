import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  File? _file;
  ImagePicker imgpk = ImagePicker();
  Future<void> Takephoto(ImageSource source) async {
    try {
      var obj = await imgpk.pickImage(source: source);
      if (obj != null) {
        _file = File(obj.path);
      }
    } catch (err) {
      print(err);
    }
  }

  void menuButtonUp() {
    showModalBottomSheet(
        context: (context),
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Column(
              children: [
                Text(
                  'ເລືອກລາຍການ',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 280,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Icon(Icons.camera_alt_rounded),
                          title: Text('Camera'),
                          onTap: () {
                            Takephoto(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Icon(Icons.image),
                          title: Text('Gallery'),
                          onTap: () {
                            Takephoto(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ຈັດການຂໍ້ມູນຫົວໜ່ວຍ'),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 200.0,
              height: 220.0,
              child: _file != null
                  ? Image.file((_file as File))
                  : Image.network(
                      'https://st4.depositphotos.com/17828278/24401/v/450/depositphotos_244011872-stock-illustration-image-vector-symbol-missing-available.jpg'),
            ),
            Positioned(
                bottom: 2,
                right: 2,
                child: IconButton(
                  onPressed: () {
                    menuButtonUp();
                  },
                  icon: Icon(Icons.camera_alt_outlined),
                )),
          ],
        ),
      ),
    );
  }
}
