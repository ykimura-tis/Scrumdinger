---
marp: true
theme: default
backgroundColor: floralwhite
style: |
  section {
    justify-content: start;
  }
  h1{
    font-size: 28px;margin: 0px 2px;border-bottom: medium solid #008A00;color:green;
  }
  h2{
    font-size: 24px;margin: 0px 2px;border-bottom: medium solid #008A00;color:green;
  }
  h3{
    font-size: 20px;margin: 0px 2px;border-bottom: medium solid #008A00;color:green;
  }
  h4{
    font-size: 18px;margin: 0px 2px;border-bottom: medium solid #008A00;color:green;
  }
  p{
    font-size: 18px;margin: 1px 1px;
  }
  img[src*='#center'] {
    display: block;
    margin: auto;
  }
  pre {
    font-size: 18px;
  }
  pre code{
    font-size: 18px;
  }
  p code {
    font-size: 18px;
  }
  ol li{
     font-size: 18px;
  }
  ul li{
    font-size: 18px;
  }
  ul li code{
    font-size: 18px;
  }
  section.title h1 {
    text-align: center;
    font-size: 40px;
    border-bottom: none;
  }
  section.title h2 {
    text-align: center;
    font-size: 30px;
    border-bottom: none;
  }
  table，thead, th {
    font-size: 60%;
  } 
  table，th, td {
    font-size: 50%;
  }
  img {
    vertical-align: top;
  } 
  blockquote {
    border-top: 0.1em dashed var(--black);
    font-size: 12px;
    width: 100%;
    width: 90%;
    position: absolute;
    bottom: 10px;;
    padding-left: 0px;
  }
  section::after {
    content: attr(data-marpit-pagination) " / " attr(data-marpit-pagination-total);
  }
  :root {
    --fw: 1;
  }
  /* ----- レイアウト ----- */
  .flex{
    display: flex;
    gap: 1em;
  }
  .fw div{
    flex: var(--fw);
    /* background-color: rgb(244, 238, 255);
    border: 8px dashed rgb(93, 0, 255); */
  }/* ---------- */

---
<!-- _class: title -->
---
<!-- _class: title -->
 iOS開発 2
<span style="font-size:160pt;">　</span>
 木村幸敏


---
目次


---
# SwiftUI essentials
## Using stacks to arrange views
https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views

In this section, you’ll build the header of the timer screen to display the elapsed time and remaining time of a meeting.
You’ll use the progress view to display the percentage of time elapsed during the scrum.

![width:800](01.png)
![width:800](02.png)


---
you’ll create a placeholder for the circular timer view that appears in the center of the screen.

![width:800](03.png)


---
# Views
## Creating a card view
https://developer.apple.com/tutorials/app-dev-training/creating-a-card-view

Create a color theme

![width:800](04.png)


---
Create a daily scrum model

![width:800](05.png)


---
Create the card view
CardView will summarize the DailyScrum model data and display the title, the number of participants, and the duration.
you’ll style the card to highlight the most important information, and you’ll modify the visual components to ensure adequate contrast between text and background views in light and dark appearances.
Next, you’ll create a label style to stack the scrum length and clock icon horizontally. With the LabelStyle protocol, you can create a consistent design throughout your app by reusing the same label style for several views.

![width:800](06.png)


---
## Displaying data in a list
https://developer.apple.com/tutorials/app-dev-training/displaying-data-in-a-list
you’ll dynamically generate rows from an array of DailyScrum objects

![width:800](07.png)


---
Open DailyScrum.swift, and declare conformance to the Identifiable protocol.

![width:800](08.png)


---
Open ScrumdingerApp.swift, and set ScrumsView as the initial view for the app.

```
@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
```


---
# Navigation and modal presentation
## Creating a navigation hierarchy
https://developer.apple.com/tutorials/app-dev-training/creating-a-navigation-hierarchy

Set up navigation
In ScrumsView.swift, embed the List in a NavigationStack.
Add a NavigationLink, passing Text(scrum.title) as the destination in the initializer.
Add a toolbar, and add a Button toolbar item that displays the plus icon. Pass an empty action to the button for now.

![width:800](09.png)


---
Create the detail view

![width:800](10.png)


---
Iterate through attendees
In DailyScrum.swift, create an extension with an inner structure named Attendee that is identifiable.
In DetailView.swift, create a Section with a header of "Attendees" to group the attendee information.

![width:800](11.png)


---
Navigate between screens
Wrap the Start Meeting Label with a NavigationLink that sets MeetingView as the destination.

![width:800](12.png)


---
## Managing data flow between views
https://developer.apple.com/tutorials/app-dev-training/managing-data-flow-between-views


---
## Creating the edit view
https://developer.apple.com/tutorials/app-dev-training/creating-the-edit-view

Add a @State property named scrum that represents the scrum you’re editing. Initialize the new property with an empty scrum.

![width:800](13.png)


---
Display attendees in the edit view

![width:800](14.png)


---
Present the edit view
When isPresentingEditView changes to true, the app presents DetailEditView using a modal sheet that partially covers the underlying content.

![width:800](15.png)


---
# Passing data
## Passing data with bindings
https://developer.apple.com/tutorials/app-dev-training/passing-data-with-bindings

Add a theme view

![width:800](16.png)


---
Add a theme picker

![width:800](17.png)


---
Pass the edit view a binding to data
In DetailEditView.swift, add a theme picker, and pass it a binding to a theme.

![width:800](18.png)


---
Pass a binding into the detail view
In ScrumsView.swift, convert the scrums constant to a binding.

Pass a binding into the list view
In ScrumdingerApp.swift, add a private @State property named scrums.

![width:800](19.png)


---
# State management
https://developer.apple.com/tutorials/app-dev-training/making-classes-observable
https://developer.apple.com/tutorials/app-dev-training/responding-to-events
## Managing state and life cycle
https://developer.apple.com/tutorials/app-dev-training/managing-state-and-life-cycle
Create an overlay view
Start by adding some visual polish to the meeting timer screen.

![width:800](20.png)


---
Extract the meeting header
In this section, you’ll extract the meeting header into its own view, create properties to pass a meeting’s elapsed and remaining time, and update the logic of the progress view and accessibility labels.

![width:800](21.png)


---
Add a state object for a source of truth
Add a call to the meeting header subview that uses scrumTimer to provide the secondsElapsed and secondsRemaining arguments.

![width:800](22.png)


---
Add life cycle events
Add an onAppear modifier, and call scrumTimer.reset, passing in the length in minutes and attendees.
Add an onDisappear modifier, and call scrumTimer.stopScrum().

![width:800](23.png)


---
Extract the meeting footer
Create a new SwiftUI View file named MeetingFooterView.swift, and extract the HStack from MeetingView.swift to the MeetingFooterView body.
In MeetingView.swift, add a call to the MeetingFooterView, passing speakers and the skip action.

![width:800](24.png)


---
Trigger sound with AVFoundation

![width:800](25.png)


---
## Updating app data
https://developer.apple.com/tutorials/app-dev-training/updating-app-data

Use the edit view to create a new scrum

![width:800](26.png)


---
Add scrum history
In MeetingView.swift, create a History, and insert it into scrum.history.

![width:800](27.png)


---
# Persistence and concurrency
## Persisting data
https://developer.apple.com/tutorials/app-dev-training/persisting-data

Add codable conformance
Codable is a type alias that combines the Encodable and Decodable protocols. When you implement these protocols on your types, you can use the Codable API to easily serialize data to and from JSON.

![width:800](28.png)


---
Create a data store
An ObservableObject includes an objectWillChange publisher that emits when one of its @Published properties is about to change. Any view observing an instance of ScrumStore will render again when the scrums value changes.
Add a method to load data
In this section, you’ll add a method to read JSON data from the scrums.data file and decode the data to an array of daily scrums.
Add a method to save data

![width:800](29.png)


---
Load data on app launch
Use a do-catch statement to load the saved scrum or halt execution if load() throws an error.

![width:800](30.png)


---
Save data in inactive state
Call saveAction() if the scene is moving to the inactive phase.
In ScrumdingerApp.swift, add a trailing closure to the ScrumsView initializer, and create an empty Task inside.

![width:800](31.png)


---
## Adopting new API features
https://developer.apple.com/tutorials/app-dev-training/adopting-new-api-features
## Handling errors
https://developer.apple.com/tutorials/app-dev-training/handling-errors

Add an error wrapper structure
Create an error view

![width:800](32.png)


---
Report errors
In ScrumdingerApp.swift, add an optional state variable named errorWrapper.

![width:800](33.png)


---
Simulate data corruption
`xcrun simctl get_app_container booted name.yukitoshi.Scrumdinger data`


---
# Drawing
## Drawing the timer view
https://developer.apple.com/tutorials/app-dev-training/drawing-the-timer-view

Create the meeting timer view
you’ll create MeetingTimerView, which builds upon the circle to present a visualization of meeting progress and the current speaker’s name.

![width:800](34.png)


---
Draw an arc segment
In this section, you’ll create a single arc segment that traces a portion of a circle, representing one speaker’s time.
Draw the progress ring
The stroke modifier traces a line along the path of the shape.

![width:800](35.png)
![width:800](36.png)


---
# Recording audio
## Examining data flow in Scrumdinger
https://developer.apple.com/tutorials/app-dev-training/examining-data-flow-in-scrumdinger
## Transcribing speech to text
https://developer.apple.com/tutorials/app-dev-training/transcribing-speech-to-text

![width:800](37.png)
![width:800](38.png)


---
Integrate speech recognition

![width:800](39.png)


---
Display recording indicators

![width:800](40.png)


---
Create a history view

![width:800](41.png)


---
Display a history view

![width:800](42.png)


---
---
# UIKit essentials
## Getting started with Today
https://developer.apple.com/tutorials/app-dev-training/getting-started-with-today
## Creating a list view
https://developer.apple.com/tutorials/app-dev-training/creating-a-list-view


![width:800](../Today/01.png)


---
