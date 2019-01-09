# Coviu iOS Swift Demo

This demonstration application demonstrates how to use the Coviu SDK to integrate video call capabilities into a Swift based application.

## Preparation

If you have not already created a Podfile in your application, please create one by followings:

* pod init

Open the **podfile** that you just created and add the followings:

* pod 'CoviuSDKiOS'

Save it and run:

* pod install

Now you can open the **.xcworkspace** file in Xcode.

<img src="imgs/xcworkspace_img.png" width="200">

## Step 1: Import the Coviu SDK via a bridging header

The Coviu SDK is written in Objective-C. In order to use it within a Swift application, you must first include it within your applications bridging header.

(If you don't have a bridging header file, you can easily have Xcode create it for you by simply adding an Objective-C file to your project, and accepting the prompt when Xcode asks you if you would like to create a bridging header file. You can safely delete the Objective-C file that you created initially).

In your bridging header file, simply add:

```
#import <CoviuSDKiOS/CoviuSDKiOS.h>
```

The Coviu SDK will now be available in your Swift files.

## Step 2: Create a Coviu view in your app

Here you will add Coviu in your application. Create a new ViewController, or use an existing ViewController, and do the following:

```
class ViewController: UIViewController {

    // Store the view as a class constant
    let coviuView = CoviuSDKiOS();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Coviu View to point at your desired URL, and display
        coviuView.addCoviuView(view, withURL: "https://coviu.com/sign_in");
    }

    // Hide the status bar, as Coviu is designed to work full screen
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
```

You can replace the `withURL` parameter with the URL to a Coviu room URL to load up a call directly.

## Step 3: Configure Build Settings

* Coviu iOS SDK is supported in **iOS 9.1** or higher. Please make sure the deployment target is set to be newer than this.

* To access the camera, microphone, and Bluetooth devices, the values of **NSCameraUsageDescription**, **NSMicrophoneUsageDescription** and NSBluetoothPeripheralUsageDescription in the info.plist file must be set.
 These description will inform users why your app needs these devices.

 ```xml
 	<key>NSMicrophoneUsageDescription</key>
	<string>Microphone is needed for COVIU calls.</string>
	<key>NSBluetoothPeripheralUsageDescription</key>
	<string>Bluetooth adaptor is needed if a bluetooth device presents.</string>
	<key>NSCameraUsageDescription</key>
	<string>Camera is needed for COVIU calls.</string>
 ```

 * You will also need to set `Enable Bitcode` in your Build Settings to `No`.
