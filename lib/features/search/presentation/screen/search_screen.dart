import 'package:flutter/material.dart';

import '../cubit/search_cubit.dart';
import '../widgets/widget.dart';

class SearchScreen extends SearchDelegate<dynamic> {
  SearchScreen(this.searchCubit)
      : super(
          searchFieldLabel: '¿Qué película buscas?',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  final SearchCubit searchCubit;

  @override
  List<Widget>? buildActions(BuildContext context) => <Widget>[
        if (query.isNotEmpty)
          IconButton(
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              query = '';
              searchCubit.reset();
            },
          ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => const BackButton();

  @override
  Widget buildResults(BuildContext context) {
    searchCubit.searchTerm(query);

    return SearchResult(
      searchCubit: searchCubit,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchCubit.searchTerm(query);

    return SearchResult(
      searchCubit: searchCubit,
    );
  }
}
