import 'package:book_hub_lite/domain/entities/book_entity.dart';
import 'package:book_hub_lite/helpers/styles/app_color.dart';
import 'package:flutter/material.dart';

class CartBookContainer extends StatelessWidget {
  const CartBookContainer({
    super.key,
    required this.book,
    required this.onRemoveTap,
  });

  final BookEntity book;
  final VoidCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Book Cover
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              book.image ?? 'assets/default_book.png',
              width: 50,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Book Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title ?? 'Unknown Title',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  book.author ?? 'Unknown Author',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "\$${book.price?.toStringAsFixed(2) ?? '0.00'}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          // Remove Button
          IconButton(
            icon: const Icon(Icons.remove_circle, color: AppColor.primary),
            onPressed: onRemoveTap,
          ),
        ],
      ),
    );
  }
}
