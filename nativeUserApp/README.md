# How to Run NFC App with Cordova on Android

1. Make sure node is installed
2. Install cordova: npm install -g cordova
3. Generate a new cordova project: cordova create <project-name>
4. Install the android platform for cordova: cordova platform add android --save
5. Follow the instructions to set up Android development: https://cordova.apache.org/docs/en/5.1.1/guide/platforms/android/
    1. DO NOT INSTALL ANYTHING RELATED TO ANDROID TV OR ARM
6. Enable development mode on your Android phone: http://www.greenbot.com/article/2457986/how-to-enable-developer-options-on-your-android-phone-or-tablet.html
7. Enable USB Debugging on Android phone (checkbox in developer settings, make sure in PTP mode)
8. (Optional, if you don’t have a package.json) set up an npm package: npm init
9. Install gulp locally and globally:
    1. npm install -D gulp
    2. npm install -g gulp
10. Follow instructions for the gulp-jade plugin in (a new file) gulpfile.js: https://www.npmjs.com/package/gulp-jade
11. Install gulp-jade npm install -D gulp-jade
12. Run gulp templates to compile the Jade into HTML - should output to the www folder - see sample gulpfile.js 
13. Build the android app: cordova build android --debug
14. Install and run on device: cordova run android --device

## NFC

1. Install NFC plugin: cordova plugin add phonegap-nfc --save

Other Points 
