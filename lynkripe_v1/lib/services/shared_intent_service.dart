import 'dart:async';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
class SharedIntentService {
   StreamSubscription? _intentDataStreamSubscript;

   final Function(String)? onMediaRecieved;

   SharedIntentService({ this.onMediaRecieved });
  
  

  bool isValidUrl(String text){
       return text.startsWith('http://') ||
              text.startsWith('https://') ||
              text.startsWith('www.');
    }
    void processSharedMedia(List<SharedMediaFile> files){
       if(files.isNotEmpty && files.first.path.startsWith('text:')){
         final sharedText = files.first.path.substring(5);
         if(isValidUrl(sharedText)){
          onMediaRecieved?.call(sharedText);
         }
       }
    }

    //listen when media is shared on app closed
   
  void initlaize(){
    _intentDataStreamSubscript = ReceiveSharingIntent.instance.getMediaStream().listen((List<SharedMediaFile>? files){
          processSharedMedia(files!); 
    
    },
    onError: (err){
      print("Error in media stream: $err");
     });
  
 
    // Check for initial shared media
    ReceiveSharingIntent.instance.getInitialMedia().then((List<SharedMediaFile>? files) {
      if (files != null) {
        processSharedMedia(files);
      }
    });
  }

    void dispose(){
      _intentDataStreamSubscript?.cancel();
    }
//late sharedintentservice _sharedintentService
  
}
