//
//  Prescriped.swift
//  PrescriptionTracker
//
//  Created by Alan Muszynski on 4/28/23.
//

import SwiftUI

struct Prescribed: View {
    let item: Medicine
    var body: some View {
        VStack(alignment: .leading){
            Text(item.name)
                .font(.headline)
            Text("Hours Per Use: \(item.HoursPerUse)")
                .font(.subheadline)
        }
    }
}
