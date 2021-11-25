part of '../view.dart';

class GoogleAnim extends StatefulWidget {
  final bool show;
  final double height;
  final double? width;

  const GoogleAnim({
    Key? key,
    required this.show,
    required this.height,
    this.width,
  }) : super(key: key);

  @override
  _GoogleAnimState createState() => _GoogleAnimState();
}

class _GoogleAnimState extends State<GoogleAnim> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 4),
        vsync: this,
        value: 0,
    );
    _controller.animateTo(0.6);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(GoogleAnim old) {
    if (widget.show) {
      _controller.repeat();
    } else {
      _controller.animateTo(
        0.6,
      );
    }
    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    ///TODO: Find Better approach
    return Transform.scale(
      scale: 1.05,
      child: Lottie.asset(
        'assets/anim/google_anim.json',
        controller: _controller,
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}