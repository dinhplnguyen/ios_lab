//
//  StudentDetailView.swift
//  week08_coreData
//
//  Created by Dinh Phi Long Nguyen on 2022-10-29.
//

import SwiftUI

struct StudentDetailView: View {
    
    let student: Student
    let coreDataManager: CoreDataManager
    
    @State private var studentID: String = ""
    @State private var studentSchool: String = ""
    @State private var studentName: String = ""
    @Binding var studentRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(student.studentID ?? "", text: $studentID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField(student.school ?? "", text: $studentSchool)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField(student.name ?? "", text: $studentName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Update") {
                if !studentID.isEmpty {
                    student.studentID = studentID
                }
                if !studentSchool.isEmpty {
                    student.school = studentSchool
                }
                if !studentName.isEmpty {
                    student.name = studentName
                }
                coreDataManager.updateStudent()
                studentRefresh.toggle()
            }
        }
    }
}
struct StudentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetailView(student: Student(), coreDataManager: CoreDataManager(), studentRefresh: .constant(false))
    }
}

