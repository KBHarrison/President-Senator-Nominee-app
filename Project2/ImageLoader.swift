//
//  ImageLoader.swift
//  Project2
//
//  Created by IS 543 on 10/21/19.
//  Copyright © 2019 Student. All rights reserved.
//

import SwiftUI
import Combine


struct ImageLoadingView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: URL) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
            }
        }
        .onAppear(perform: imageLoader.load)
        .onDisappear(perform: imageLoader.cancel)
    }
}

final class ImageLoader: ObservableObject {
    enum ImageLoadingError: Error {
        case incorrectData
    }
    
    @Published private(set) var image: UIImage? = nil
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        cancellable = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap { data, _ in
                guard let image = UIImage(data: data) else {
                    throw ImageLoadingError.incorrectData
                }
                
                return image
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { _ in },
            receiveValue: { [weak self] image in
                self?.image = image
            }
        )
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

protocol ImageLoadable {
    func loadImage() -> AnyPublisher<UIImage, Error>
}

extension URL: ImageLoadable {
    enum ImageLoadingError: Error {
        case incorrectData
    }
    
    func loadImage() -> AnyPublisher<UIImage, Error> {
        URLSession
            .shared
            .dataTaskPublisher(for: self)
            .tryMap { data, _ in
                guard let image = UIImage(data: data) else {
                    throw ImageLoadingError.incorrectData
                }
                
                return image
        }
        .eraseToAnyPublisher()
    }
}
