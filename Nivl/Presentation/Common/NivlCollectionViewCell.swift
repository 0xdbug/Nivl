//
//  NivlCollectionViewCell.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit
import Nuke

class NivlCollectionViewCell: UICollectionViewCell {
    static let id = "nivlMainCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
 
    func configureWithItem(item: NivlItem) async {
        let url = URL(string: item.headerImage) ?? URL(string: "")!
        do {
            try await loadImage(url)
        } catch {
            print("Failed to load image")
        }
        titleLabel.text = item.title
    }
    
    func loadImage(_ url: URL) async throws {
        let imageTask = ImagePipeline.shared.imageTask(with: url)
        for await progress in imageTask.progress {
            // Update progress
        }
        imageView.image = try await imageTask.image
    }
    
}
