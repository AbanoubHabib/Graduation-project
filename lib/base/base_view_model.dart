abstract class BaseViewModel extends BaseViewModelInputs {
  // Shared variables and methods that will be used throw all view models
  void dispose();
}

abstract class BaseViewModelInputs {
//start view model job
  void start();
//killer view model job
  void dispose();
}

abstract class BaseViewModelOutputs {}
