//
//  ContentView.swift
//  Week9_Firebase
//
//  Created by Dinh Phi Long Nguyen on 2022-11-04.
//

import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    let db = Database.database().reference()
    var body: some View {
        VStack{
            Button("Save details") {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .short
                dateFormatter.timeStyle = .long
                let newRef = db.child("HTGame").childByAutoId()
                
                db.child("something").child(newRef.key!).setValue([
                    "college": newRef.key,
                    "date-time": dateFormatter.string(from: Date())
                ])
            }
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .font(.title)
            .cornerRadius(10)
            
            Button("Read details") {
                db.child("something").observeSingleEvent(of: .value, with:{ snapshot in
                    guard let value = snapshot.value as? [String: Any] else {
                        return
                    }
                    print("Value: \(value)")
                })
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .font(.title)
            .cornerRadius(10)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
