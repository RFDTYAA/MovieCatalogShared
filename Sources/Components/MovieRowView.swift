import SwiftUI
import Kingfisher

struct MovieRowView: View {
    let movie: Movie

    public var body: some View {
        HStack(spacing: 16) {
            if #available(macOS 11.0, *) {
                KFImage(URL(string: Constants.imageBaseURL + (movie.posterPath ?? "")))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)
                    .cornerRadius(12)
            } else {
                Image("placeholder_poster")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)
                    .cornerRadius(12)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primaryText)
                    .lineLimit(2)

                if let rating = movie.rating, rating > 0 {
                    HStack {
                        if #available(macOS 11.0, *) {
                            Image(systemName: "star.fill")
                        } else {
                            Text("⭐️")
                        }
                        
                        Text(String(format: "%.1f", rating))
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(Color.theme.accent)
                }
                
                Text(movie.overview ?? "No overview available.")
                    .font(.caption)
                    .lineLimit(3)
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}
