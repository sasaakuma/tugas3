import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key, required this.title});

  final String title;

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  String _imageFile = '';
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final PickedFile = await picker.pickImage(source: source);
    if(PickedFile != null ) {
      setState(() {
        _imageFile = PickedFile.path;
      });
    }
  }
  

  void _showPicker() {
    showModalBottomSheet(
      context:  context,
      builder: (BuildContext context) {
        return Column(
          children: [
            ListTile(
              title: Text(
                'Image Source',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _getImage(ImageSource.gallery);
              },
            ),
            ListTile(
               leading: Icon(Icons.photo_camera),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _getImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16),
        child: Column(
          children: [
            _imageFile.isNotEmpty
              ?  Image.file(
                File(_imageFile),
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              )
              : Container(
                color: Colors.grey,
                height: 250,
                width: double.infinity,
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                onPressed: _showPicker, 
                child: const Text('Take Picture'),
              ),
          ],
        ),
      ),
    );
  }
}
