
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lynkripe_v1/constants.dart';
class OnboardingPage extends StatefulWidget{
  @override
  State<OnboardingPage> createState() => _onboardingState();
}

class _onboardingState extends State<OnboardingPage> {
    // const onboarding({super.key});
    late PageController _pageController;

    @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState(); 
  } 

   @override
   void dispose(){
    _pageController.dispose();
    super.dispose();
   }

    @override
    Widget build(BuildContext context){
      return  Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child:Column(children: [
          Expanded(child:PageView.builder(
            itemCount: data.length,
            controller: _pageController,
            itemBuilder: (context, index) =>
         OnboardingComponent(
          image: data[index].image,
          title: data[index].title,
          description: data[index].description,
        )
      ),
      ),
       
      SizedBox( 
      height: 60, 
      width:60,
      child: ElevatedButton(
        onPressed: (){
          _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        }, 
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: primary
       ),
        child: Icon(Icons.arrow_forward,color: Colors.white,))
    
      )
        ],
        )
        
      ),
      );
    }
}
class Onboard {
  final String image,title,description;

  const Onboard({
    required this.image,
    required this.title,
    required this.description
  });

}

 final List<Onboard> data = [
       Onboard(
          image: "assets/sharelink.png",
          title: "All your Links in one place",
          description: "Save any link in seconds, no more losing track of saved content!",
        ),
          Onboard(
          image: "assets/sharelink2.png",
          title: "Create Hubs to share",
          description: "Sort bookmarks into Hubs and share them with your friends",
        ),
          Onboard(
          image: "assets/sharelink.png",
          title: "Be on Top of it!",
          description: "Everything is taken care of, all you have to do is save!",
        ),
          Onboard(
          image: "assets/sharelink.png",
          title: "All your Links in one place",
          description: "Yadadadadadadadadada",
        )
  ];
class OnboardingComponent extends StatelessWidget {

  final String image,title,description;

  const OnboardingComponent({
    super.key,
    required this.image,
    required this.title,
    required this.description
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       crossAxisAlignment: CrossAxisAlignment.center,
       verticalDirection: VerticalDirection.down,
      children: [
        SizedBox(height: 150,),
        
        Image.asset(image, height:250 ),
          SizedBox(height: 150,),
        Text(title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
               .textTheme
               .headlineSmall!
               .copyWith(fontWeight: FontWeight.w400),
           
               ),
      const SizedBox(height:16),
      Text(description, 
      textAlign: TextAlign.center, 
      style: GoogleFonts.inter(
         fontSize: 12,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      )
      ),
    
      ]
    );
  }
}
