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