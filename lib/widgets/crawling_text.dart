// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math_64.dart';

final yellow = Color(0xFFFFFF00);

class CrawlingText extends StatelessWidget {
  final String text;

  CrawlingText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
        flex: 5,
        child: Perspective(child: TextCrawler(text: text)),
      ),
      Flexible(
        flex: 1,
        child: Column(),
      ),
    ]);
  }
}

class TextCrawler extends StatefulWidget {
  final crawlDuration = const Duration(seconds: 20);
  final String text;

  TextCrawler({required this.text});

  @override
  createState() => _TextCrawlerState();
}

class _TextCrawlerState extends State<TextCrawler> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 500),
        () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: widget.crawlDuration,
            curve: Curves.linear));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SuperSize(
      height: 1500,
      child: ListView(
        controller: _scrollController,
        children: [
          SizedBox(height: height),
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: yellow,
              fontSize: 24,
            ),
          ),
          SizedBox(height: height),
        ],
      ),
    );
  }
}

class SuperSize extends StatelessWidget {
  SuperSize({
    required this.child,
    this.height = 1000,
  });
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: height,
      maxHeight: height,
      child: child,
    );
  }
}

class Perspective extends StatelessWidget {
  Perspective({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(-3.14 / 3.5),
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}
