import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentmate/features/home/cubit/home_cubit.dart';
import 'package:rentmate/features/home/screens/item_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RentMate'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              Navigator.pushNamed(context, '/chat'); // Navigate to Chat
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                final homeCubit = context.read<HomeCubit>();
                homeCubit.applyFilters(query, null, null); // Apply search query
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  final homeCubit = context.read<HomeCubit>();
                  homeCubit.applyFilters(_searchController.text, 0,
                      10000); // Filter by price range
                },
                child: const Text('Under Rs.10000'),
              ),
              ElevatedButton(
                onPressed: () {
                  final homeCubit = context.read<HomeCubit>();
                  homeCubit.applyFilters(_searchController.text, 10000,
                      100000); // Filter by price range
                },
                child: const Text('Rs.10000 - Rs.100000'),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is HomeLoaded) {
                  return ListView.builder(
                    itemCount: state.rentalItems.length,
                    itemBuilder: (context, index) {
                      final item = state.rentalItems[index];
                      return ListTile(
                        leading: Image.network(item.imageUrl),
                        title: Text(item.title),
                        subtitle: Text('Rs.${item.price.toStringAsFixed(2)}'),
                        onTap: () {
                          // Navigate to item details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ItemDetailsScreen(item: item),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                if (state is HomeError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
