import SwiftUI

struct FavoritesPageView: View {
    private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2) // 2 колонки

    @StateObject var viewModel = AdvertisementsViewModel()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 10)]

    var body: some View {
        
        LazyVGrid(columns: gridLayout, spacing: 20) {
            ForEach(viewModel.advertisements) { advertisement in
                VStack {
                    Text(advertisement.title).font(.headline)
                    Text(advertisement.description).font(.subheadline)
                    Text("Цена: \(advertisement.price)").font(.caption)
                    
                    // Пример отображения изображения (если у вас есть URL изображения)
                    AsyncImage(url: URL(string: advertisement.mainImageUrl)) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
        .padding()
                .onAppear {
                    viewModel.loadAdvertisements(req: "")
                }
        }
}

#Preview {
    FavoritesPageView()
}
