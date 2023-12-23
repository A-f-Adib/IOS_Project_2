//
//  SortStringArray.swift
//  new.SwT
//
//  Created by A.f. Adib on 12/24/23.
//

import SwiftUI

struct Person : Identifiable , Comparable {
    let id = UUID()
    let firstName : String
    let lastName : String
    
    static func < (lhs: Person, rhs: Person) ->Bool {
        lhs.lastName < rhs.lastName
    }
}

struct SortStringArray: View {
    
    let persons = [
        Person(firstName: "Adrian", lastName: "Colin"),
        Person(firstName: "Benjamin", lastName: "Arnold"),
        Person(firstName: "Caster", lastName: "Berlin")
    ].sorted()
//        .sorted {
//        $0.lastName < $1.lastName}
    
    var body: some View {
        List(persons) { person in
            Text("\(person.firstName) \(person.lastName)")
        }
    }
}

struct SortStringArray_Previews: PreviewProvider {
    static var previews: some View {
        SortStringArray()
    }
}
