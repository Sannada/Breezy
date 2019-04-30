#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
<<<<<<< HEAD
#import "GoogleMaps/GoogleMaps.h"

=======
// Add the GoogleMaps import.
#import "GoogleMaps/GoogleMaps.h"
>>>>>>> master
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
<<<<<<< HEAD
=======
  // Add the following line with your API key.
>>>>>>> master
  [GMSServices provideAPIKey:@"AIzaSyC9g_39KNI0QDKC1SW50Pz6Oz0YbHRBY8o"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end