//
//  DateTimePicker.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 13.09.2021.
//

import SwiftUI

struct DateTimePicker: View {

    @State var myDate: Date
    @Binding var myDateText: String

    let dateRange = Date(timeIntervalSince1970: 0)...Date()

    var body: some View {

        VStack {
            DatePicker(selection: $myDate, in: dateRange) {
                TextField("TextField", text: $myDateText)
            }

            Form {
                DatePicker("TextField", selection: $myDate, in: ...Date())
            }

            DatePicker("TextField2", selection: $myDate, in: ...Date())

            Form {
                Text(myDate.description)
                Text(myDate.description)
                Text(myDate.description)
                Text(myDate.description)
                Text(myDate.description)
                Text(myDate.description)
                Text(myDate.description)
                Text(myDate.description)
                Text(myDate.description)
            }
        }


    }
}

#if DEBUG
struct DateTimePicker_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePicker(myDate: Date(), myDateText: .constant("String"))
    }
}
#endif
