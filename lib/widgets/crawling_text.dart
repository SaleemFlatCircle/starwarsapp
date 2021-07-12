
import 'package:flutter/material.dart';

class CrawlingText extends StatefulWidget {
  const CrawlingText({
    Key? key,
    required this.crawlingText,
  }) : super(key: key);

  final String crawlingText;

  @override
  _CrawlingTextState createState() => _CrawlingTextState();
}

class _CrawlingTextState extends State<CrawlingText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.crawlingText),
    );
  }
}