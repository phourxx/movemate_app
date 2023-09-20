import 'package:flutter/material.dart';
import 'package:moniepoint_quiz/helpers/colors.dart';

class Shipment{
  final String product;
  final String reference;
  final num amount;
  final String status;
  final IconData iconData;
  final Color color;

  Shipment({
    required this.product,
    required this.reference,
    required this.amount,
    required this.status,
    required this.iconData,
    required this.color,
  });
}

final shipments = [
  Shipment(product: 'Macbook Pro M2', reference: '#Ab234943045943', amount: 400, status: 'completed', iconData: Icons.done_all_rounded, color: Colors.green,),
  Shipment(product: 'Summer linen jacket', reference: '#Ab123443045943', amount: 500, status: 'pending', iconData: Icons.av_timer_rounded, color: AppColors.orange,),
  Shipment(product: 'Tampered-fit jeans', reference: '#XD234943045943', amount: 600, status: 'in-progress', iconData: Icons.recycling_rounded, color: Colors.blue,),
  Shipment(product: 'Slim-fit jeans', reference: '#AR039403045943', amount: 700, status: 'pending', iconData: Icons.av_timer_rounded, color: AppColors.orange,),
  Shipment(product: 'Office desk', reference: '#QA234942034942', amount: 800, status: 'in-progress', iconData: Icons.recycling_rounded, color: Colors.blue,),
  Shipment(product: 'Sun glasses', reference: '#AD293024804943', amount: 900, status: 'completed', iconData: Icons.done_all_rounded, color: Colors.green,),
  Shipment(product: 'Italian suit', reference: '#ED293840294892', amount: 200, status: 'completed', iconData: Icons.done_all_rounded, color: Colors.green,),
  Shipment(product: 'Iphone 15 Pro Max', reference: '#AP298038948809', amount: 300, status: 'pending', iconData: Icons.av_timer_rounded, color: AppColors.orange,),
  Shipment(product: 'Samsung Galaxy U23', reference: '#SR280481832940', amount: 450, status: 'in-progress', iconData: Icons.recycling_rounded, color: Colors.blue,),
  Shipment(product: '20kg dumbbell', reference: '#PR930492839403', amount: 490, status: 'in-progress', iconData: Icons.recycling_rounded, color: Colors.blue,),
];