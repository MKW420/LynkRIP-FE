
abstract class ClipboardRepository{

    Future<void> saveClipitems(String text, String url);
    
    Future<void> saveClipLink(String url);

    Future<void> loadSavedClips();
    
    Future<void> deleteClips(String id);

    bool isValidURL(String url);


}
