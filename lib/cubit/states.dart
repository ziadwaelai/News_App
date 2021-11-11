abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportLoadingState extends NewsStates {}

class NewsGetSportSuccessState extends NewsStates {}

class NewsGetSportErrorState extends NewsStates {
  final String error;

  NewsGetSportErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetsearcheLoadingState extends NewsStates {}

class NewsGetsearchSuccessState extends NewsStates {}

class NewsGetsearchErrorState extends NewsStates {
  final String error;

  NewsGetsearchErrorState(this.error);
}

class NewsvalidtSuccessState extends NewsStates {}

class LanguchState extends NewsStates {}

class WebReloadeState extends NewsStates {}

