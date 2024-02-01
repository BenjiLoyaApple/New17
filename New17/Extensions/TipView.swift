//
//  SwiftUIView.swift
//  Empty171
//
//  Created by Benji Loya on 08.11.2023.
//

import Foundation
import TipKit

//MARK: - Add Note
struct NoteTip: Tip {
    var title: Text {
        Text("Add entry")
    }
    var message: Text? {
        Text("Create your first entry.")
    }
    var image: Image? {
        Image(systemName: "note.text")
    }
}

//MARK: - Delete Note
struct DeleteNoteTip: Tip {
    static let setDeleteNoteEvent = Event(id: "setDeleteNoteEvent")
    static let deleteNoteVisitedEvent = Event(id: "deleteNoteVisitedEvent")
    var title: Text {
        Text("Entry Actions")
    }
    var message: Text? {
        Text("Swipe left to edit or delete entry.")
    }
//    var image: Image? {
//        Image(systemName: "trash")
//    }
    
    var rules: [Rule] {
        #Rule(Self.setDeleteNoteEvent) { event in
            event.donations.count == 0
        }
        #Rule(Self.deleteNoteVisitedEvent) { event in
            event.donations.count > 2
        }
    }
}


/*
 //MARK: VIEW
 import TipKit
 
 // Note Tip
 @State private var noteTip = NoteTip()
 @State private var deleteNoteTip = DeleteNoteTip()
 
 Example 1:
 
 TipView(deleteNoteTip)
 
 .onAppear {
     Task { await DeleteNoteTip.deleteNoteVisitedEvent.donate()}
 }
 
 
 Example 2:
 
 Button {
 
     noteTip.invalidate(reason: .actionPerformed)
 } label: {
     Image(systemName: "plus.circle.fill")
         .font(.title3)
         .foregroundColor(.primary)
 }
 .popoverTip(noteTip)
 
*/
