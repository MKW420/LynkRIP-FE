import 'package:user_repository/user_repository.dart';

abstract class LinkRepo{

    Future<void> createLink(Bookmark bookmark);

    Future<List<Map<String,dynamic>>> getAllLinks();
    
     Future<Map<String,dynamic>?> getLink(String id);

    Future<void> deleteLink(String id);

}
