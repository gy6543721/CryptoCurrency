//
//  ChartView.swift
//  CryptoCurrency
//
//  Created by Macbook Air M1 on 2022/12/14.
//

import SwiftUI
import Charts
import SwiftUICharts

struct ChartView: View {
    let viewModel: CryptoViewModel
    var body: some View {
        if #available(iOS 16.0, *) {
            Chart {
                ForEach(viewModel.chartData) { item in
                    LineMark(x: .value("Date", item.date), y: .value("Price", item.value))
                }
                .interpolationMethod(.cardinal)
            }
            .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
            .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
            .chartXAxis {
                AxisMarks(position: .bottom, values: viewModel.xAxisValue)
            }
            .chartYAxis {
                AxisMarks(position: .leading, values: viewModel.yAxisValue)
            }
        } else {
            // SwiftUICharts LineChart
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(viewModel: CryptoViewModel(coin: dev.coin))
    }
}
