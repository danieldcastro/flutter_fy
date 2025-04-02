extension DateTimeExtensions on DateTime {
  String formatDate({bool includeDay = true}) {
    if (includeDay) {
      return "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
    } else {
      return "${month.toString().padLeft(2, '0')}/$year";
    }
  }
}
