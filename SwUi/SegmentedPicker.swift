//
//  SegmentedPicker.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 02.09.2021.
//

import SwiftUI

enum InspectLog: String, CaseIterable, Identifiable {
    case driver
    case vehicle
    case company

    var id: String { self.rawValue }
}

struct InspectLogModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let text: String
}

struct SegmentedPicker: View {

    @State var selecterSegment = InspectLog.driver

    var model: [InspectLogModel] = [
        InspectLogModel(title: "Driver ID", text: "rakesh"),
        InspectLogModel(title: "ELD Malfunction Indicators", text: "N / A"),
        InspectLogModel(title: "Unidentified Driver Records", text: "N / A"),
        InspectLogModel(title: "Time Zone", text: "PDT"),
        InspectLogModel(title: "Co-Driver ID / Name", text: "N / A"),
        InspectLogModel(title: "Data Diagnostic Indicators", text: "N / A"),
        InspectLogModel(title: "Exempt Driver Status", text: "No"),
        InspectLogModel(title: "Home Terminal Address", text: "SCF 52 Phase 61, Abbotsford, BC, CANADA")
    ]

    var body: some View {
//        ZStack {
//            Color.yellow
            VStack {
                VStack {
                    Picker("Title", selection: $selecterSegment) {
                        Text("DRIVER").tag(InspectLog.driver)
                        Text("VEHICLE").tag(InspectLog.vehicle)
                        Text("COMPANY").tag(InspectLog.company)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    LazyHGrid(rows: layout(), alignment: .top, spacing: 30) {
                        ForEach(makeModel()) { item in
                            VStack(alignment: .leading) {
                                Text(item.text)
                                    .foregroundColor(.blue)
                                Text(item.title)
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                            }
                            .frame(width: 160, height: 65, alignment: .leading)
                            .overlay(Divider().frame(width: 160), alignment: .bottom)
                        }
                    }
                    .fixedSize()
                }
                .background(Color.white)
                Spacer()
            }
//            .frame(width: .infinity, height: .infinity, alignment: .center)
//        }
    }

    private func layout() -> [GridItem] {
        switch selecterSegment {
        case .driver:
            return [
                GridItem(.fixed(65)),
                GridItem(.fixed(65)),
                GridItem(.fixed(65)),
                GridItem(.fixed(65))
            ]
        case .vehicle:
            return [
                GridItem(.fixed(65)),
                GridItem(.fixed(65)),
                GridItem(.fixed(65))
            ]
        case .company:
            return [
                GridItem(.fixed(65)),
                GridItem(.fixed(65))
            ]
        }
    }

    private func makeModel() -> [InspectLogModel] {
        switch selecterSegment {
        case .driver:
            return [
                InspectLogModel(title: "Driver ID", text: "rakesh"),
                InspectLogModel(title: "ELD Malfunction Indicators", text: "N / A"),
                InspectLogModel(title: "Unidentified Driver Records", text: "N / A"),
                InspectLogModel(title: "Time Zone", text: "PDT"),
                InspectLogModel(title: "Co-Driver ID / Name", text: "N / A"),
                InspectLogModel(title: "Data Diagnostic Indicators", text: "N / A"),
                InspectLogModel(title: "Exempt Driver Status", text: "No"),
                InspectLogModel(title: "Home Terminal Address", text: "SCF 52 Phase 61, Abbotsford, BC, CANADA")
            ]
        case .vehicle:
            return [
                InspectLogModel(title: "Driver ID", text: "rakesh"),
                InspectLogModel(title: "ELD Malfunction Indicators", text: "N / A"),
                InspectLogModel(title: "Unidentified Driver Records", text: "N / A"),
                InspectLogModel(title: "Time Zone", text: "PDT"),
                InspectLogModel(title: "Co-Driver ID / Name", text: "N / A"),
                InspectLogModel(title: "Data Diagnostic Indicators", text: "N / A")
            ]
        case .company:
            return [
                InspectLogModel(title: "Unidentified Driver Records", text: "N / A"),
                InspectLogModel(title: "Time Zone", text: "PDT"),
                InspectLogModel(title: "Co-Driver ID / Name", text: "N / A"),
                InspectLogModel(title: "Data Diagnostic Indicators", text: "N / A")
            ]
        }
    }
}

#if DEBUG
struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPicker()
    }
}
#endif
