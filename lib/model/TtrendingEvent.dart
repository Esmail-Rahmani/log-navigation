import 'User.dart';

class TrendingEvent {
  final int id;
  final String name;
  final String image;
  final DateTime date;
  final double rate;
  final bool paid;
  final double distance;
  final String address;
  final List<User> followers;

  TrendingEvent(
      {required this.id,
        required this.image,
      required this.name,
      required this.date,
      required this.rate,
      required this.paid,
      required this.distance,
      required this.address,
      required this.followers});
}
