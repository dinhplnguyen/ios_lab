//
//  ContentView.swift
//  week08_coreData
//
//  Created by Dinh Phi Long Nguyen on 2022-10-28.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let coreDataManager: CoreDataManager
    
    @State private var movieTitle: String = ""
    @State private var movieYear: String = ""
    @State private var movies: [Movie] = [Movie]()
    @State private var needsRefresh: Bool = false
    
    @State private var studentID: String = ""
    @State private var studentName: String = ""
    @State private var studentSchool: String = ""
    @State private var students: [Student] = [Student]()
    @State private var studentRefresh: Bool = false
    
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    TextField("Movie title", text: $movieTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Movie year", text: $movieYear)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save") {
                        let intMovieYear:Int? = Int(movieYear)
                        coreDataManager.saveMovie(title: movieTitle, year: intMovieYear!)
                        populateMovies()
                    }
                    List {
                        ForEach(movies, id: \.self) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie, coreDataManager: coreDataManager,needsRefresh: $needsRefresh),
                                           label: {
                                HStack {
                                    Text(movie.title ?? "")
                                        .frame(width: 150)
                                    Text(verbatim: "\(movie.year)")
                                }
                                .font(.system(size: 12, weight: .light, design: .default))
                            })
                        }
                        .onDelete(perform: { indexSet in
                            indexSet.forEach({ index in
                                let movie = movies[index]
                                coreDataManager.deleteMovie(movie: movie)
                                populateMovies()
                            })
                        })
                    }
                    .accentColor(needsRefresh ? .white : .black)
                    Spacer()
                    
                }
                .navigationTitle("Movie")
            }
            .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            NavigationView {
                
                VStack {
                    TextField("Student ID", text: $studentID)
                    TextField("Name", text: $studentName)
                    TextField("School", text: $studentSchool)
                    
                    Button("Save") {
                        coreDataManager.saveStudent(studentID: studentID, name: studentName, school: studentSchool)
                        populateStudents()
                    }
                    List {
                        ForEach(students, id: \.self) { student in
                            NavigationLink(destination: StudentDetailView(
                                student: student,
                                coreDataManager: coreDataManager,
                                studentRefresh: $needsRefresh), label: {
                                    HStack {
                                        Text(student.studentID ?? "")
                                        Text(student.name ?? "")
                                        Text(student.school ?? "")
                                    }
                                    .font(.system(size: 12, weight: .light, design: .default))
                                })
                        }
                        .onDelete(perform: { indexSet in
                            indexSet.forEach({ index in
                                let student = students[index]
                                coreDataManager.deleteStudent(student: student)
                                populateStudents()
                            })
                        })
                    }
                    .accentColor(studentRefresh ? .white : .black)
                    Spacer()
                    
                }.navigationTitle("Student")
                
            }.tabItem {
                Label("Menu", systemImage: "list.dash")
            }
        }
        .padding()
        .onAppear(perform: {
            populateMovies()
            populateStudents()
        })
    }
    
    private func populateMovies() {
        movies = coreDataManager.getAllMovies()
    }
    
    private func populateStudents() {
        students = coreDataManager.getAllStudent()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDataManager: CoreDataManager())
    }
}
