//
//  CoreDataManager.swift
//  week08_coreData
//
//  Created by Dinh Phi Long Nguyen on 2022-10-28.
//

import Foundation

import CoreData
class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "MovieModel")
        // default database is SQLite
        persistentContainer.loadPersistentStores {
            (description, error) in
            if let err = error {
                fatalError("Core data store failed: \(err.localizedDescription)")
            }
        }
    }
    
    // Student 
    func saveStudent(studentID: String, name: String, school: String) {
        let student = Student(context: persistentContainer.viewContext)
        student.studentID = studentID
        student.name = name
        student.school = school
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
    }
    
    func getAllStudent() -> [Student] {
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func deleteStudent(student: Student) {
        persistentContainer.viewContext.delete(student)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete movie \(error)")
        }
    }
    
    func updateStudent() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to update movie \(error)")
        }
    }
    
    // Movie
    func saveMovie(title: String, year: Int) {
        let movie = Movie(context: persistentContainer.viewContext)
        movie.title = title
        movie.year = Int16(year)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save movie \(error)")
        }
    }
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    func deleteMovie(movie: Movie) {
        persistentContainer.viewContext.delete(movie)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete movie \(error)")
        }
    }
    func updateMovie() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to update movie \(error)")
        }
    }
}
