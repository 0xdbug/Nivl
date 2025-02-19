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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup() {
        layer.cornerRadius = 15
        backgroundColor = UIColor.secondarySystemBackground
    }
 
    func configureWithItem(item: NivlItem) async {
        setup()
        dateLabel.text = item.date
        titleLabel.text = item.title
        
        do {
            try await loadImage(item.headerImageURL)
        } catch {
            print("Failed to load image")
        }
    }
    
    func loadImage(_ url: URL) async throws {
        let imageTask = ImagePipeline.shared.imageTask(with: url)
        for await _ in imageTask.progress {
            // Update progress
        }
        imageView.image = try await imageTask.image
    }
    
}
