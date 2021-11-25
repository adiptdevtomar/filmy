import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundAvatar extends StatelessWidget {
  final String? avatarUrl;
  final String placeholderString;
  final double? radius;
  final Color? backgroundColor;
  final TextStyle? style;

  const RoundAvatar({
    Key? key,
    required this.avatarUrl,
    required this.placeholderString,
    this.backgroundColor,
    this.style,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _radius = radius ?? 16.0;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: _radius * 2,
      height: _radius * 2,
      child: CachedNetworkImage(
        imageUrl: avatarUrl!,
        fit: BoxFit.cover,
        errorWidget: (context, error, stackTrace) {
          //error
          return SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor ?? Colors.grey,
              ),
              child: Center(
                child: Icon(
                  Icons.error,
                  size: 15.0,
                ),
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor ?? Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
