import 'package:book_hub_lite/helpers/styles/app_color.dart';
import 'package:book_hub_lite/helpers/styles/app_images.dart';
import 'package:book_hub_lite/presentation/book_details/book_details_cubit.dart';
import 'package:book_hub_lite/presentation/book_details/book_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/service_locator.dart';
import '../wishlist/wishlist_cubit.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key, required this.cubit});
  final BookDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                pinned: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.pop(context),
                  color: Colors.white,
                ),
                actions: [
                  IconButton(
                    icon:
                        (sl<WishlistCubit>().state.books.contains(cubit.params))
                            ? Image.asset(AppImages.bookmark2)
                            : Image.asset(
                                AppImages.bookmark,
                                color: Colors.white,
                              ),
                    onPressed: () {
                      cubit.onAddToWishlistTap();
                    },
                    color:
                        (sl<WishlistCubit>().state.books.contains(cubit.params))
                            ? AppColor.primary
                            : Colors.white,
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    state.book.image ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.book.title ?? "",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        state.book.author ?? "",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'About the author',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.book.aboutAuthor ?? '',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.book.overview ?? '',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                cubit.navigator.navigateToReadBook(state.book);
                              },
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: AppColor.primary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Read Preview'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                cubit.onAddToCartTap();
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                  'Buy for \$${state.book.price?.toStringAsFixed(2) ?? "14.95"}'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
