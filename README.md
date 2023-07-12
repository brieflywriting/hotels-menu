# hotels-menu

This is a test task for Pavel Skasyrskii.

## Description

This project is a test task. Personal use only.
It is two Flutter screens: one with hotels, the other with information about specific hotel.
##Beware
I didn't find images of hotels, so I had to scrape them with photoId parameter. 
The website those images are on doesn't support the mechanism of getting them, so it violates the CORS policy. 
This is why in release build you will have an error image instead of it. However,you can run it if you disable CORS policy via arguments as `flutter run -d chrome --web-browser-flag --disable-web-security` or use VS code's debug profile.
## Installation
I have posted this whole project here. 
To use it, clone this repository and run `flutter pub get`.


However, if you seek for the built version, it can be found in the [releases](https://github.com/brieflywriting/hotels-menu/releases).
To install it, download it and run it on your server. 
