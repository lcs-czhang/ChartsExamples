//
//  SwiftUIView.swift
//  ChartsExamples
//
//  Created by Yuzhou Zhang on 2024-11-04.
//

import SwiftUI
import Charts

struct SwiftUIView: View {
    let chartData = [ (city: "Hong Kong", data: hkWeatherData),
                      (city: "London", data: londonWeatherData),
                      (city: "Taipei", data: taipeiWeatherData) ]
    var body: some View {
        VStack {
            Chart {
                ForEach(hkWeatherData) { item in
                    LineMark(
                        x: .value("Month", item.date),
                        y: .value("Temp", item.temperature)
                    )
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .month)) { value in
                    AxisGridLine()
                    AxisValueLabel(format: .dateTime.month(.defaultDigits))
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartPlotStyle { plotArea in
                plotArea
                    .background(.blue.opacity(0.1))
            }
            .frame(height: 300)
        }
    }
}

#Preview {
    SwiftUIView()
}
