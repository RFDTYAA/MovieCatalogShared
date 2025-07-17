import SwiftUI
import Kingfisher // Pastikan Kingfisher sudah di-import

struct MovieRowView: View {
    let movie: Movie // Asumsi Anda punya struct Movie

    public var body: some View {
        HStack(spacing: 16) {
            // MARK: - Movie Poster Image
            if #available(macOS 11.0, *) {
                // Kode untuk macOS 11.0 dan lebih baru
                KFImage(URL(string: Constants.imageBaseURL + (movie.posterPath ?? "")))
                    .placeholder {
                        // Gunakan ProgressView sebagai placeholder modern
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)
                    .cornerRadius(12)
            } else {
                // Fallback untuk macOS 10.15
                // KFImage mungkin tidak berfungsi, jadi gunakan placeholder sederhana
                Image("placeholder_poster") // Ganti dengan nama aset gambar placeholder Anda
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)
                    .cornerRadius(12)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline) // .headline tersedia di versi lama
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.primaryText)
                    .lineLimit(2)

                // MARK: - Rating
                if let rating = movie.rating, rating > 0 {
                    HStack {
                        if #available(macOS 11.0, *) {
                            Image(systemName: "star.fill") // SFSymbol hanya untuk macOS 11+
                        } else {
                            Text("⭐️") // Gunakan Emoji sebagai fallback
                        }
                        
                        Text(String(format: "%.1f", rating))
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                    .foregroundColor(Color.theme.accent)
                }
                
                // MARK: - Overview
                Text(movie.overview ?? "No overview available.")
                    .font(.caption)
                    .lineLimit(3)
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}
