import 'package:firebase_auth/firebase_auth.dart';
import 'package:lynkripe_v1/models/models.dart';

abstract class ClipboardRepository{

    Future<void> saveClipboardItem(String text);

    Future<void> loadSavedClips();
    
    Future<void> deleteClips(String id);
}
