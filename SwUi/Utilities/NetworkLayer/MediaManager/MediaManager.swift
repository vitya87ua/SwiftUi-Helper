//
//  MediaManager.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 06.12.2022.
//

import Foundation

protocol MediaNetwork {
    func upload(imageData: Data, fileName: String, completion: @escaping (Result<Response<MediaData>, Error>) -> Void)
}

class MediaManager: RequestManager, MediaNetwork {
    func upload(imageData: Data, fileName: String, completion: @escaping (Result<Response<MediaData>, Error>) -> Void) {
        request(PutUploadImageRequest(imageData: imageData, fileName: fileName), completion: completion)
    }
}
