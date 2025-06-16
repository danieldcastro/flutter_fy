part of 'fy_loading_rotating_dots.dart';

class _DrawDot extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const _DrawDot({
    required double dotSize,
    required this.color,
  })  : width = dotSize,
        height = dotSize;

  @override
  Widget build(BuildContext context) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
}
