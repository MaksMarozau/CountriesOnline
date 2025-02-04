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
******************************************************************************************

**Screenshots**

<img width="350" height="800" alt="Снимок экрана 2025-02-04 в 16 05 35" src="https://github.com/user-attachments/assets/241b7061-a400-4e4b-a3fc-02537f7c30c0" />
<img width="350" height="800" alt="Снимок экрана 2025-02-04 в 16 07 54" src="https://github.com/user-attachments/assets/bf0ef0b0-df33-4130-a9cd-1bd6f76ac060" />
<img width="350" height="800" alt="Снимок экрана 2025-02-04 в 16 06 53" src="https://github.com/user-attachments/assets/89a98417-fa62-4215-aa0d-5f146f9f7ea8" />
<img width="350" height="800" alt="Снимок экрана 2025-02-04 в 16 06 27" src="https://github.com/user-attachments/assets/de8583a2-6e5b-49ad-a597-45ee35182715" />
<img width="350" height="800" alt="Снимок экрана 2025-02-04 в 16 06 05" src="https://github.com/user-attachments/assets/b949a279-3952-4020-88e0-4fa503cef04d" />
