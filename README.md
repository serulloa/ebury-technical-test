This repository was created for an Ebury technical test.

## Introduction
This was developed using the latest updates for Xcode and Swift of June 2024, so make sure you are up to date before trying to build and run!

You don't need any dependency manager, as is all in-house code.

## Architecture
### Presentation
I have chosen **MVVM** for the presentation layer, as I think it matches very well with **SwiftUI+Combine**. It has only one small particularity and that is that I have omitted the VM where I think it is not necessary, because of SwiftUI's own philosophy of using basic components without presentation logic. This logic is all contained in the VMs of the features.

### Domain
In the domain layer I have used **UseCases** with the business logic and I have created corresponding mocks so that they can be used in the SwiftUI previews to avoid overloading them.

### Data
The data layer I have subdivided it in:
* **Datasources**, which are responsible for performing the data fetching, either from API, Keychain, UserDefaults, etc.
* **Repositories**, which, in a larger project with more datasources, would be in charge of managing the obtaining of data from different datasources and the mapping of this data to domain models.
* **Repository mocks**, they could be here or in the Test folder, I think it's a matter of preference. I would rather have them here.

### Other
I have also created an Assembly file to make the dependency management of the UseCases easier and simpler.

Finally, I have tried to implement the simplest networking possible, so that it is easy to use it from the datasources. It is composed of:
* **APIClient**
* **Endpoint**, a protocol to define what an endpoint is.
* **APIEndpoint**, an enum to facilitate the use of these endpoints.
* **Parser**, a class to perform the data parsing in a simple way.

I have stuck to what is necessary to implement the solution, I have tried to avoid adding unnecessary code such as a ```.POST``` case in the HTTPMethod enum. This is the reason why maybe there are things that in a larger project would make more sense.