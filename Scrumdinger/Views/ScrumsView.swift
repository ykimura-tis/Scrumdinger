//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by 木村幸敏 on 2024/12/29.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) {
            if scenePhase == .inactive { saveAction() }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
