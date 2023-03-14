import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:wave_header/pages/home/wave_persistent_header_delegate.dart';
import 'package:wave_header/pages/widgets/holed_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: WavePersistentHeaderDelegate(
              forceElevated: false,
              elevation: 4,
              shadowColor: Colors.black,
              minHeight: 150,
              maxHeight: 250,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'wave header sliver'.toUpperCase(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        'with flutter'.toUpperCase(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            sliver: SliverToBoxAdapter(child: HoledCard()),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 18),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lorem(words: 5).toUpperCase(),
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(lorem(paragraphs: 1),
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  childCount: 1000))
        ],
      ),
    );
  }
}
