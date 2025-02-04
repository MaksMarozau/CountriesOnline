**About CountriesOnline**
*******************************************************************************************
CountriesOnline is a mobile tourism app that provides for users up-to-date and detailed information about any country. The app offers several key features:

**Features**
Detailed Country Information – Get the latest data about any country.
Favorites List – Save countries for quick access.
Map Display – View selected countries on a map.
Sharing – Share country details via external services.
Localization – Supports English and Russian languages.
Theme Selection – Switch between light and dark modes.
******************************************************************************************

**Data Handling**

Sorting & Filtering
Countries are sorted alphabetically by default.
Filter countries by name using user-input characters.

Caching Mechanism
On the first launch, data is loaded from the network and cached.
If the network is unavailable on subsequent launches, data is retrieved from the cache.
If the network is available, data is updated and cached again.

Error Handling & Alerts – Implements error handling with user notifications via alerts.
******************************************************************************************

**Technologies Used**

Networking – Uses URLSession for API requests.
Network Status Monitoring – Implemented via Network framework.
Image Loading & Caching – Powered by Kingfisher.
UI Development – Built with SwiftUI.
Architecture – Follows the MVVM pattern.
Data Persistence – Uses CoreData for local storage.
Concurrency – Utilizes GCD and async/await with error handling.
Map Integration – Uses MapKit for working with maps.

**Design**

CountriesOnline features a custom UI design with extensive use of interactive UI elements.
******************************************************************************************

**__Important__**

Third-Party SDKs
Kingfisher – Version 8.1.4 is used for image loading and caching.

Installation
To build the project, install dependencies using Swift Package Manager (SPM) or CocoaPods.
