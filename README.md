# snackTruck
SnackTruck is an iOS Application that is used to order items from the SnackTruck service.

- [Implemented Use Cases](#usescase)
- [Known Issues](#issues)
- [Future Improvements](#improvements)
- [Notes](#notes)

## Implemented Use Cases

Priority 1 Use Case
- The customer is able to select snacks from the list and submit orders.
- A summary of the order is shown at the confirmation of the order.
- All selections return to default once the order has successfully been submitted.
- Selections do not return to default if the order was unsuccessful or the cart was empty.
- send() is located in the OrderRequestHandler class.

Priority 2 Use Case
- The customer is able to filter the snack list by snack type.
- The toggles are on by default.

## Known Issues
### Issue #1
The following error is shown the first time a toggle is switched: "invalid mode 'kCFRunLoopCommonModes' provided to CFRunLoopRunSpecific - break on _CFRunLoopError_RunCalledWithInvalidMode to debug. This message will only appear once per execution." No crashes or visible affects are seen.

Possible root cause: Current version of SwiftUI (Using Xcode 11.2 with Mojave)

Actions taken: Did a few google searches and it seems that its still an issue in simulated/preview environments. It might also be that my OS version hasn't been upgraded to Catalina.

## Future Improvements
### View sizing for multiple devices
Application is too small on larger iPads and a few GUI elements are too close to the edges on smaller devices. Most of my testing was done on an iPhone 11
### Addition of Priority 3 Use Case
Most of the setup is already in place for this use case. The following are the elements I plan to implement:
- AddItemView subview that will be presented as a modal/sheet (similar to OrderConfirmationView) that will be triggered by a Button '+' image.
- AddItemView will contains a Form that has the following elements:
1. Toggle for SnackType
2. Text field to enter snack name
3. Save button - check that data entered is valid (i.e. non empty text field) and create SnackData object and add it to snackData (snackData would need to be changed from a constant). snackData would also need to be put back into JSON format and write over snackData.json

To address the operator vs customer issue, I propose the following changes:
1. Add an authentication mechanism with the service to authorize editing. So when the Add button is pressed, a dialog would be presented asking for a username/password.
2. When adding an item, I propose that instead of immediately adding the new item that the item addition is posted to the service first. This will handle the situations in which the item might be determined invalid and sync'ing other devices with the same data. The service would then return a new snackData list. All other elements should theoretically be updated.

## Notes
### Toggles vs checkboxes vs Steppers
I originally implemented the SnackType filters as checkboxes but as I was developing it felt very un-iOS like in the look/feel. Since the requirements stated checkboxes for its selection elements I left the items as checkboxes but had the filters be toggles since it is inherently state aware and simplified the code a bit.

If the customer would like to have more of an iOS look and feel to their app, I would suggest replacing checkboxes with Steppers for the item views. This will also allow for expandability into adding an item count for each ordered item.

### Use of SwiftUI
The assignment didn't specify the toolkit to use. I chose to use SwiftUI as a challenge for myself and thought this assignment would be the perfect way to try it out. I had alot of fun learning and trying it out!
