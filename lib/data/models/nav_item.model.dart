import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavItem extends Equatable {
  final Widget? body;
  final String title;
  final String subTitle;
  final String cta;
  final String content;
  final dynamic unselectedImgPath;
  final dynamic selectedImgPath;
  final String imagePath;
  final bool isIcon;
  Function()? onTap;
  final bool hideIcon;
  final Color? color;
  final dynamic key;

  @override
  List<Object?> get props => [title];

  NavItem({
    this.key,
    this.color,
    this.content = '',
    this.onTap,
    this.body,
    this.title = '',
    this.subTitle = '',
    this.cta = '',
    this.imagePath = '',
    this.isIcon = true,
    this.hideIcon = false,
    this.unselectedImgPath,
    this.selectedImgPath,
  });
}
