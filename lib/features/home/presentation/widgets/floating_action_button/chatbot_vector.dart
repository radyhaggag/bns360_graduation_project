part of 'home_floating_action_button.dart';

class _RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(56.9718, 46.0219);
    path_0.cubicTo(60.6189, 39.7202, 61.8499, 32.3073, 60.4351, 25.1651);
    path_0.cubicTo(59.0203, 18.0229, 55.0563, 11.639, 49.2823, 7.20354);
    path_0.cubicTo(43.5082, 2.76812, 36.3182, 0.58393, 29.0527, 1.05821);
    path_0.cubicTo(21.7872, 1.53249, 14.9421, 4.63287, 9.79367, 9.7813);
    path_0.cubicTo(4.64524, 14.9297, 1.54487, 21.7748, 1.07059, 29.0403);
    path_0.cubicTo(0.596306, 36.3058, 2.78049, 43.4959, 7.21591, 49.2699);
    path_0.cubicTo(11.6513, 55.0439, 18.0353, 59.0079, 25.1775, 60.4227);
    path_0.cubicTo(32.3197, 61.8375, 39.7326, 60.6066, 46.0343, 56.9594);
    path_0.lineTo(57.7062, 60.8688);
    path_0.cubicTo(58.1467, 61.0157, 58.6194, 61.037, 59.0713, 60.9304);
    path_0.cubicTo(59.5232, 60.8237, 59.9365, 60.5933, 60.2648, 60.265);
    path_0.cubicTo(60.5932, 59.9366, 60.8236, 59.5233, 60.9302, 59.0714);
    path_0.cubicTo(61.0369, 58.6195, 61.0156, 58.1468, 60.8687, 57.7063);
    path_0.lineTo(56.9718, 46.0219);
    path_0.close();

    Paint borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06;
    borderPaint.color = AppColors.primary;
    borderPaint.strokeCap = StrokeCap.round;
    borderPaint.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, borderPaint);

    Paint fillPaint = Paint()..style = PaintingStyle.fill;
    fillPaint.color = AppColors.white;
    canvas.drawPath(path_0, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
