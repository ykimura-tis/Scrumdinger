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

![width:800](Scrumdinger/01.png)
![width:800](Scrumdinger/02.png)


---
you’ll create a placeholder for the circular timer view that appears in the center of the screen.

![width:800](Scrumdinger/03.png)


---
# Views
## Creating a card view
https://developer.apple.com/tutorials/app-dev-training/creating-a-card-view

Create a color theme

![width:800](Scrumdinger/04.png)


---
Create a daily scrum model

![width:800](Scrumdinger/05.png)


---
Create the card view
CardView will summarize the DailyScrum model data and display the title, the number of participants, and the duration.
you’ll style the card to highlight the most important information, and you’ll modify the visual components to ensure adequate contrast between text and background views in light and dark appearances.
Next, you’ll create a label style to stack the scrum length and clock icon horizontally. With the LabelStyle protocol, you can create a consistent design throughout your app by reusing the same label style for several views.

![width:800](Scrumdinger/06.png)


---
## Displaying data in a list
https://developer.apple.com/tutorials/app-dev-training/displaying-data-in-a-list
you’ll dynamically generate rows from an array of DailyScrum objects

![width:800](Scrumdinger/07.png)


---
Open DailyScrum.swift, and declare conformance to the Identifiable protocol.

![width:800](Scrumdinger/08.png)


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

![width:800](Scrumdinger/09.png)


---
Create the detail view

![width:800](Scrumdinger/10.png)


---
Iterate through attendees
In DailyScrum.swift, create an extension with an inner structure named Attendee that is identifiable.
In DetailView.swift, create a Section with a header of "Attendees" to group the attendee information.

![width:800](Scrumdinger/11.png)


---
Navigate between screens
Wrap the Start Meeting Label with a NavigationLink that sets MeetingView as the destination.

![width:800](Scrumdinger/12.png)


---
## Managing data flow between views
https://developer.apple.com/tutorials/app-dev-training/managing-data-flow-between-views


---
## Creating the edit view
https://developer.apple.com/tutorials/app-dev-training/creating-the-edit-view

Add a @State property named scrum that represents the scrum you’re editing. Initialize the new property with an empty scrum.

![width:800](Scrumdinger/13.png)


---
Display attendees in the edit view

![width:800](Scrumdinger/14.png)


---
Present the edit view
When isPresentingEditView changes to true, the app presents DetailEditView using a modal sheet that partially covers the underlying content.

![width:800](Scrumdinger/15.png)


---
# Passing data
## Passing data with bindings
https://developer.apple.com/tutorials/app-dev-training/passing-data-with-bindings

Add a theme view

![width:800](Scrumdinger/16.png)


---
Add a theme picker

![width:800](Scrumdinger/17.png)


---
Pass the edit view a binding to data
In DetailEditView.swift, add a theme picker, and pass it a binding to a theme.

![width:800](Scrumdinger/18.png)


---
Pass a binding into the detail view
In ScrumsView.swift, convert the scrums constant to a binding.

Pass a binding into the list view
In ScrumdingerApp.swift, add a private @State property named scrums.

![width:800](Scrumdinger/19.png)


---
廃棄したか確認
https://developer.apple.com/tutorials/app-dev-training/passing-data-with-bindings

勉強
https://developer.apple.com/tutorials/app-dev-training/making-classes-observable
https://developer.apple.com/tutorials/app-dev-training/responding-to-events



# State management
## Managing state and life cycle

https://developer.apple.com/tutorials/app-dev-training/managing-state-and-life-cycle
Create an overlay view
Start by adding some visual polish to the meeting timer screen.

![width:800](Scrumdinger/20.png)


---
Extract the meeting header
In this section, you’ll extract the meeting header into its own view, create properties to pass a meeting’s elapsed and remaining time, and update the logic of the progress view and accessibility labels.

![width:800](Scrumdinger/21.png)


---
Add a state object for a source of truth
Add a call to the meeting header subview that uses scrumTimer to provide the secondsElapsed and secondsRemaining arguments.

![width:800](Scrumdinger/22.png)


---
Add life cycle events
Add an onAppear modifier, and call scrumTimer.reset, passing in the length in minutes and attendees.
Add an onDisappear modifier, and call scrumTimer.stopScrum().

![width:800](Scrumdinger/23.png)


---
Extract the meeting footer
Create a new SwiftUI View file named MeetingFooterView.swift, and extract the HStack from MeetingView.swift to the MeetingFooterView body.
In MeetingView.swift, add a call to the MeetingFooterView, passing speakers and the skip action.

![width:800](Scrumdinger/24.png)


---
Trigger sound with AVFoundation

![width:800](Scrumdinger/25.png)


---
## Updating app data
https://developer.apple.com/tutorials/app-dev-training/updating-app-data

Use the edit view to create a new scrum

![width:800](Scrumdinger/26.png)


---
Add scrum history
In MeetingView.swift, create a History, and insert it into scrum.history.

![width:800](Scrumdinger/27.png)


---
# Persistence and concurrency
## Persisting data
https://developer.apple.com/tutorials/app-dev-training/persisting-data

![width:800](Scrumdinger/01.png)


---

![width:800](Scrumdinger/01.png)


---

![width:800](Scrumdinger/01.png)


---

![width:800](Scrumdinger/01.png)


---

![width:800](Scrumdinger/01.png)


---

![width:800](Scrumdinger/01.png)


---

![width:800](Scrumdinger/01.png)


---
