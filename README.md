# MyLocationApp
Creating a Demo app to fetch locations from API, Display them in a tableview and connect Wikipedia App via deep linking.

1. Created an App to fetch list of locations from API and load the data in a TableView on LocationListViewController.
2. Followed MVVM Architecture pattern for development.
3. Added HttpUtility class to perform network operations and provide the list of locations.
4. Created LocationCapture screen to collect latitude and longitude as a user input.
5. Added Validation for input parameters in LocationCapture screen.
6. Added Deep Linking via URLScheme to open Wikipedia app.
7. When user clicks on any location displayed on the list the cordinates of that location is passed as a query parameter in the deep link url.
8. Passing of data between applications can also be done using OAuth or any other Authentication API key.
9. The location when passed to Wikipedia app is displayed in a Map in the Wikipedia Places Tab.
10. Same functionality works when user enter the location manually and clicks submit.
