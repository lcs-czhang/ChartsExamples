//
//  ContentView.swift
//  ChartsExamples
//
//  Created by Yuzhou Zhang on 2024-11-04.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Day", "Monday"),
                y: .value("Steps", 6019)
            )

            BarMark(
                x: .value("Day", "Tuesday"),
                y: .value("Steps", 7200)
            )
        }
        .padding()
    }
}

struct ExampleTwoView: View {
    let weekdays = Calendar.current.shortWeekdaySymbols
    let steps = [ 10531, 6019, 7200, 8311, 7403, 6503, 9230 ]

    var body: some View {
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark(x: .value("Day", weekdays[index]), y: .value("Steps", steps[index]))
            }
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ExampleTwoView()
}
