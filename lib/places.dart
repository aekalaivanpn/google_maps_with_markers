import 'package:google_maps_flutter/google_maps_flutter.dart';

class Places {
  String name;
  String address;
  String description;
  String thumbnail;
  LatLng coordinates;

  Places(
      {required this.name,
        required this.address,
        required this.description,
        required this.thumbnail,
        required this.coordinates});
}

final List<Places> placesOfInterest = [
  Places(
    name: 'Madhumitha',
    address: 'Senior Manager',
    description: '3.2/5',
    thumbnail:
    'https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small_2x/beautiful-latin-woman-avatar-character-icon-free-vector.jpg',
    coordinates: LatLng(11.046111, 76.851944),
  ),
  Places(
    name: 'Manoj Jayabalan',
    address: 'Senior Executive',
    description: '4.5/5',
    thumbnail:
    'https://t4.ftcdn.net/jpg/02/23/50/73/240_F_223507324_jKl7xbsaEdUjGr42WzQeSazKRighVDU4.jpg',
    coordinates: LatLng(10.938011, 76.687177),
  ),
  Places(
    name: 'Stella Mary',
    address: 'Assistant Manager',
    description: '4.3/5',
    thumbnail:
    'https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small_2x/beautiful-latin-woman-avatar-character-icon-free-vector.jpg',
    coordinates: LatLng(11.05523, 76.993875),
  ),
  Places(
    name: 'Harry Paul Melvin',
    address: 'Team Leader',
    description: '3.9/5',
    thumbnail:
    'https://t4.ftcdn.net/jpg/02/23/50/73/240_F_223507324_jKl7xbsaEdUjGr42WzQeSazKRighVDU4.jpg',
    coordinates: LatLng(11.019349, 76.54476),
  ),
  Places(
    name: 'Harshavarthini',
    address: 'Team Leader',
    description: '2.8/5',
    thumbnail:
    'https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small_2x/beautiful-latin-woman-avatar-character-icon-free-vector.jpg',
    coordinates: LatLng(11.0591, 77.0943),
  ),
  Places(
    name: 'Karthick Naren',
    address: 'Regional Manager',
    description: '4.8/5',
    thumbnail:
    'https://t4.ftcdn.net/jpg/02/23/50/73/240_F_223507324_jKl7xbsaEdUjGr42WzQeSazKRighVDU4.jpg',
    coordinates: LatLng(11.005718, 76.970914),
  ),
];
