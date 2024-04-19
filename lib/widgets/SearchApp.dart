import 'package:flutter/material.dart';

import '../Serveis/Product_modile.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  final List<ProductModile> products;

  SearchBarDelegate({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(); // يمكنك استبدالها بعنصر واجهة المستخدم الذي تريده
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // Clear search query
          query = '';
          // Show initial search results
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // Close search delegate
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Return search results
    return Container(); // يمكنك استبدالها بعنصر واجهة المستخدم الذي تريده
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show initial search results
    return Container(); // يمكنك استبدالها بعنصر واجهة المستخدم الذي تريده
  }
}

// انقل هذا التعريف خارج كلاس SearchBarDelegate
Widget SearchBarApp({required List<ProductModile> products}) {
  return Container(); // يمكنك استبدالها بعنصر واجهة المستخدم الذي تريده
}
