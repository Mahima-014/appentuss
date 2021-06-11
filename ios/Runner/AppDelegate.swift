import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
override func application(
_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
GeneratedPluginRegistrant.register(with: self)
GMSServices.provideAPIKey("AIzaSyC2XKn9kRWKAO1K3rUW1_bQwhoIoY_thH4")
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
}