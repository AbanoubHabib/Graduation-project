import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ItemInfo {
  final int? id;
  final String tittleName;
  final String imageSrc;
  final String subTittleName;
  final double price;
  final Color? bgColor;
  final VoidCallback onTaped;
  int quantity;
  ItemInfo({
    this.bgColor,
    required this.id,
    required this.imageSrc,
    required this.tittleName,
    required this.subTittleName,
    required this.price,
    required this.onTaped,
    this.quantity = 1,
  });
}

final List<ItemInfo> dataItemsList = [
  ItemInfo(
    id: 1,
    imageSrc: 'assets/images/store/s1.png',
    tittleName: 'Nefertiti Bust',
    subTittleName:
        'The Nefertiti Bust is an iconic artifact from ancient Egypt',
    price: 99.99,
    bgColor: const Color(0xff53B175).withOpacity(0.15),
    onTaped: () {
      
    },
  ),
  ItemInfo(
      id: 2,
      imageSrc: 'assets/images/store/s2.png',
      tittleName: 'Hathor Necklace',
      subTittleName: 'Hathor is one of the most revered goddesses in ancient Egyptian mythology',
      price: 222.00,
      bgColor: const Color(0xffF8A44C).withOpacity(0.15),
      onTaped: () {}),
  ItemInfo(
      id: 3,
      imageSrc: 'assets/images/store/s3.png',
      tittleName: 'Tut Bracelet',
      subTittleName: 'Celebrate the grandeur of ancient Egypt with this Tutankhamun Bracelet',
      price: 125.0,
      bgColor: const Color(0xffF7A593).withOpacity(0.25),
      onTaped: () {}),
  ItemInfo(
      id: 4,
      imageSrc: 'assets/images/store/s4.png',
      tittleName: 'Cleopatra Tiara',
      subTittleName: 'The last active ruler of the Ptolemaic Kingdom of Egypt',
      price: 55,
      bgColor: const Color(0xffD3B0E0).withOpacity(0.25),
      onTaped: () {}),
  ItemInfo(
      id: 5,
      imageSrc: 'assets/images/store/s5.png',
      tittleName: 'King Tut',
      subTittleName: 'Referred to as King Tut, was an ancient Egyptian pharaoh of the 18th dynasty ',
      price: 169.99,
      bgColor: const Color(0xffFDE598).withOpacity(0.25),
      onTaped: () {}),
  ItemInfo(
      id: 6,
      imageSrc: 'assets/images/store/s6.png',
      tittleName: 'Osiris Amphora',
      subTittleName: 'known as the god of the afterlife, the underworld, and rebirth',
      price: 457,
      bgColor: Color.fromARGB(255, 43, 62, 73).withOpacity(0.15),
      onTaped: () {}),
  ItemInfo(
      id: 7,
      imageSrc: 'assets/images/store/s7.png',
      tittleName: 'Bastet Statue',
      subTittleName: 'This beautifully crafted statue captures the essence of Bastet, embodying her protective and nurturing qualities',
      price: 78.99,
      bgColor: const Color(0xff836AF6).withOpacity(0.15),
      onTaped: () {}),
  ItemInfo(
      id: 8,
      imageSrc: 'assets/images/store/s8.png',
      tittleName: 'Isis Vase',
      subTittleName: 'This exquisite vase is inspired by the elegance and symbolism associated with Isis',
      bgColor: const Color(0xffD73B77).withOpacity(0.2),
      price: 327,
      onTaped: () {}),
];
