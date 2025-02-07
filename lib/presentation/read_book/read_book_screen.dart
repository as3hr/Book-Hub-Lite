import 'package:book_hub_lite/presentation/read_book/read_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'read_book_state.dart';

class ReadBookScreen extends StatelessWidget {
  const ReadBookScreen({super.key, required this.cubit});
  final ReadBookCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadBookCubit, ReadBookState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(state.book.title ?? ""),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBookText(state.book.bookText),
                const Spacer(),
                Column(
                  children: [
                    const Text('Font Size'),
                    Slider(
                      value: (state.fontSize - ReadBookState.minFontSize) /
                          (ReadBookState.maxFontSize -
                              ReadBookState.minFontSize),
                      onChanged: (value) {
                        double newSize = ReadBookState.minFontSize +
                            value *
                                (ReadBookState.maxFontSize -
                                    ReadBookState.minFontSize);
                        cubit.changeFontSize(newSize);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBookText(String? text) {
    if (text == null || text.isEmpty) {
      return const SizedBox.shrink();
    }

    final firstWord = text.split(' ').first;
    final remainingText = text.substring(firstWord.length + 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstWord,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        BlocBuilder<ReadBookCubit, ReadBookState>(
          bloc: cubit,
          builder: (context, state) {
            return Text(
              remainingText,
              style: TextStyle(
                fontSize: state.fontSize,
                height: 1.6,
              ),
            );
          },
        ),
      ],
    );
  }
}
