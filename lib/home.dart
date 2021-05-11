import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Home extends StatefulWidget {
  String url;
  Home(this.url);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PDFDocument _doc;

  @override
  void initState() {
    print(widget.url + 'aaaaaaaaaaaaaaaaaaaaaaaaa');
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    final doc = await PDFDocument.fromURL(widget.url);

    setState(() {
      _doc = doc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFViewer(
        document: _doc,
        indicatorBackground: Colors.red,
        // showIndicator: false,
        // showPicker: false,
      ),
    );
  }
}
