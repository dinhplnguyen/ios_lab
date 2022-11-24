//
//  MovieDetailView.swift
//  week08_coreData
//
//  Created by Dinh Phi Long Nguyen on 2022-10-28.
//

import SwiftUI
struct MovieDetailView: View {
    let movie: Movie
    let coreDataManager: CoreDataManager
    @State private var movieTitle: String = ""
    @State private var movieYear: String = ""
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("\(movie.year)", text: $movieYear)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !movieTitle.isEmpty {
                    movie.title = movieTitle
                }
                if !movieYear.isEmpty {
                    let intMovieYear:Int? = Int(movieYear)
                    movie.year = Int16(intMovieYear!)
                }
                coreDataManager.updateMovie()
                needsRefresh.toggle()
            }
        }
    }
}
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(), coreDataManager: CoreDataManager(), needsRefresh: .constant(false))
    }
}
