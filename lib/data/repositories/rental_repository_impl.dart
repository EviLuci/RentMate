import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmate/domain/entities/rental_item.dart';

class RentalRepositoryImpl {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all rental items
  Future<List<RentalItem>> fetchRentalItems() async {
    try {
      final snapshot = await _firestore.collection('rentalItems').get();
      return snapshot.docs
          .map((doc) => RentalItem.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch rental items: $e');
    }
  }

  // Add a new rental item
  Future<void> addRentalItem(RentalItem item) async {
    try {
      await _firestore.collection('rentalItems').add(item.toMap());
    } catch (e) {
      throw Exception('Failed to add rental item: $e');
    }
  }
}
