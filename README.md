# health_care_app

 - Introducing HealthEase comprehensive healthcare companion designed for simplified access to vital medical services. Our platform redefines convenience, offering a suite of features that cater to all your healthcare needs.
- With HealthEase, effortlessly connect with top doctors across various specialties, ensuring the best possible care. Our intuitive interface allows easy browsing of healthcare providers, reading reviews, and booking appointments.
- In emergencies, HealthEase provides instant access to ambulance assistance. Locate the nearest ambulance with a few taps for prompt and reliable emergency care.
Managing medications is hassle-free with HealthEase. Purchase medicines online by uploading your prescription and have them delivered to your doorstep.
HealthEase features a comprehensive hospital directory, making it easy to find nearby healthcare facilities, whether it's a specialist clinic or a full-fledged hospital.

### Video
[![Video Title](https://img.youtube.com/vi/OiK6bT23ovA/0.jpg)](https://www.youtube.com/watch?v=OiK6bT23ovA)

### App Download Link:
[Download APK](https://rb.gy/d18cn5)


### Table of contents
- [System requirements](#system-requirements)
- [Figma design guidelines for better UI accuracy](#figma-design-guideline-for-better-accuracy)
- [Check the UI of the entire app](#app-navigations)
- [Application structure](#project-structure)
- [How to format your code?](#how-you-can-do-code-formatting)
- [How you can improve code readability?](#how-you-can-improve-the-readability-of-code)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Figma design guidelines for better UI accuracy

Read our guidelines to increase the accuracy of design-to-code conversion by optimizing Figma designs.

### Check the UI of the entire app

Check the UI of all the app screens from a single place by setting up the 'initialRoute'  to AppNavigation in the AppRoutes.dart file.

### Application structure
After successful build, your application structure should look like this:
                    
```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```
### How to format your code?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

### How you can improve code readability?

Resolve the errors and warnings that are shown in the application.

### Support

If you have any problems or questions, go to our Discord channel, where we will help you as quickly as possible: https://discord.com/invite/rFMnCG5MZ7

### Fonts
We were unable to find the following Fonts, Please add manually to ```assets/fonts``` 

```
SFProDisplayRegular.ttf
InterBlackItalic.ttf
```
