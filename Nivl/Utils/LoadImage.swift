//
//  LoadImage.swift
//  Nivl
//
//  Created by dbug on 2/20/25.
//

import UIKit
import Nuke

extension UIImageView {
    func loadImage(_ url: URL) async throws {
        let imageTask = ImagePipeline.shared.imageTask(with: url)
        for await _ in imageTask.progress {
            // 
        }
        self.image = try await imageTask.image
    }
}
