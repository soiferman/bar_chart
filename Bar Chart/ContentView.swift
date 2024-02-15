//
//  ContentView.swift
//  Bar Chart
//
//  Created by Max Soiferman on 14/2/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let salaryMonth: [salaryMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), salary: 80000),
        .init(date: Date.from(year: 2023, month: 2, day: 1), salary: 85000),
        .init(date: Date.from(year: 2023, month: 3, day: 1), salary: 90000),
        .init(date: Date.from(year: 2023, month: 4, day: 1), salary: 98000),
        .init(date: Date.from(year: 2023, month: 5, day: 1), salary: 100000),
        .init(date: Date.from(year: 2023, month: 6, day: 1), salary: 110000),
        .init(date: Date.from(year: 2023, month: 7, day: 1), salary: 112000),
        .init(date: Date.from(year: 2023, month: 8, day: 1), salary: 100000),
        .init(date: Date.from(year: 2023, month: 9, day: 1), salary: 120000),
        .init(date: Date.from(year: 2023, month: 10, day: 1), salary: 127000),
        .init(date: Date.from(year: 2023, month: 11, day: 1), salary: 131000),
        .init(date: Date.from(year: 2023, month: 12, day: 1), salary: 150000)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            Text("iOS Dev salaries")
            Text("Average Salary: \(salaryMonth.reduce(0, { $0 + $1.salary }))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Chart {
                RuleMark(y: .value("Goal", 160000))
                    .foregroundStyle(.mint)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
//                    .annotation(alignment: .leading) {
//                        Text("Goal")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                    }
                
                ForEach(salaryMonth) { salaryMonth in
                    BarMark(x: .value("Month", salaryMonth.date, unit: .month),
                            y: .value(":Salary", salaryMonth.salary))
                }
                .foregroundStyle(Color.purple.gradient)
            }
            
            .frame(height: 200)
            .chartXAxis {
                AxisMarks(values: salaryMonth.map { $0.date }) { date in
                    //AxisGridLine()
                    //AxisTick()
                    AxisValueLabel(format: .dateTime.month())
                }
                
                //AxisMarks(values: salaryMonth.map({ $0.date }))
                
            }
            .chartYAxis {
                AxisMarks { mark in
                    AxisValueLabel()
                    AxisGridLine()
                }
            }
            .padding(.bottom)
            //.chartYScale(domain: 0...200000)
            //        .chartPlotStyle { plot in
            //                plot
            //                .background(.pink.gradient.opacity(0.3))
            //                .border(.green, width: 3)
            //        }
            
            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.mint)
                Text("Monthly Goal")
                    .foregroundStyle(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct salaryMonth: Identifiable {
    let id = UUID()
    let date: Date
    let salary : Int
    
}
