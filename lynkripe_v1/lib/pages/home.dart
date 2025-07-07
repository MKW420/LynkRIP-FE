import 'package:flutter/material.dart';
import '/components/Tags.dart';
import '/components/search.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CustomListItemExample());
  }
}
class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.source,
    this.tags,
  });

  final String title;
  final String subtitle;
  final String source;
  final Widget? tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        Expanded(
          child: Text(
            subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
        ),
      Row(
          children: [
            Icon(Icons.facebook, size: 14, color: Colors.black87), 
            const SizedBox(width: 4), // Add some spacing
            Text(source, style: const TextStyle(fontSize: 12.0, color: Colors.black87)),
          ],
        ),
        if (tags != null) Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: tags!,
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.tags,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String source;
  final Widget tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(aspectRatio: 1.0, child: thumbnail),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  source: source,
                  tags: tags,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListItemExample extends StatelessWidget {
  const CustomListItemExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset('assets/linkrlogo.png', height: 150),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 5.0, top: 20.0, bottom: 10.0),
            child: Text(
              'Your Weekly Digest',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          search(),
         
          CustomListItemTwo(
            thumbnail: Container(decoration: const BoxDecoration(color: Colors.black87)),
            title: 'Flutter 1.0 Launch',
            subtitle: 'Flutter continues to improve and expand its horizons. '
                'This text should max out at two lines and clip',
            source: 'Medium',
            tags: Row(
              children: [
                Tags()
              ],
            ),
          ),
 CustomListItemTwo(
            thumbnail: Container(decoration: const BoxDecoration(color: Colors.black87)),
            title: 'Flutter 1.0 Launch',
            subtitle: 'Flutter continues to improve and expand its horizons. '
                'This text should max out at two lines and clip',
            source: 'Medium',
            tags: Row(
              children: [
               Tags()
              ],
            ),
          ),
        ],
      ),
    );
  }
}