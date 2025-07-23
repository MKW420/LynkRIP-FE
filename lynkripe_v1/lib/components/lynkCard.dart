import 'package:flutter/material.dart';
import 'package:lynkripe_v1/constants.dart';
import '/components/Tags.dart';
import '/components/search.dart';

class Lynkcard extends StatelessWidget {
  const Lynkcard({
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

class LynkItem extends StatelessWidget {
  const LynkItem({
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
                child: Lynkcard(
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

class Lynk extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String source;
  final Widget tags;

  const Lynk({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.source,
    required this.tags,
  });

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
