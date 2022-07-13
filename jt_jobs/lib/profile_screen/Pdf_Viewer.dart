import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../firebase/models/user_model.dart';

class PdfViewer extends StatefulWidget {
  final UserModel user;
  const PdfViewer(this.user, {Key key}) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          header(widget.user.name),
          Expanded(
            child: SfPdfViewer.network(
              widget.user.cvUrl,
              key: _pdfViewerKey,
            ),
          ),
        ],
      )),
    );
  }

  Widget header(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xFF211D42),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 30)
        ],
      ),
    );
  }
}
