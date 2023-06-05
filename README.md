# CaloriFit

This is an AI driven app that helps you stay healthy. Boradly speaking, it has 2 main features,

- Help you track your calorie consumption
- Help you track how many calories you burn in exercises

You simply upload a picture of what you are eating and the ML model will tell you how many calories per serving the food in question is. It will track your daily consumption based on the 3 meals you consume and can also track weekly calorie consumption. The same goes for exercises done, simply enter the type of workout and the duration and it will approximate the calories burnt.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

For this project, you need to set up a Firebase account and a Firebase app. You can find more here : https://firebase.google.com/docs/flutter/setup?platform=android

You will also need flutter installed which you can find here: https://docs.flutter.dev/get-started/install

### Installing

To initialize the app and get it running, go to the app and in your command shell type the following:

```
flutter pub get
```

## Deployment

This app was not completed since this was for a school project. To complete it, 2 cloud functions are needed. To deploy cloud functions, you will have to upgrade your firebase plan to blaze (paid after certain amount of usage). The cloud functions are relatively simple and they require you to:

- Reset the daily meals consumed and workouts periodically (preferably around midnight)
- Reset the weekly Calories consumed and calories burnt (this app takes Sunday as the first day of the week so Saturday night is best for reseting)

## Built With

- [Flutter](https://docs.flutter.dev/cookbook) - App development
- [Firebase](https://firebase.google.com/) - Data storage and Backend
- [TensorFlow](https://www.tensorflow.org/) - Used for the ML model

## Sneak Peek of the App

<div class = "DIV">
<img src="./assets/Signing-Up.gif" width="150" align='center' />
</div>

## Authors and Acknowledgements

- **Siddhant Pathak** - _Designing the UI and Polishing the Front-end. Most importantly, provided the ML model at the core of this app and a lot more! Couldn't have done this without you :)_ - [siddhantpathakk](https://github.com/siddhantpathakk)

Thanks to [am15h](https://github.com/am15h) - Provided the code to use the TFLite model withing flutter
