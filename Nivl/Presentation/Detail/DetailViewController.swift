//
//  DetailViewController.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    weak var coordinator: AppCoordinator?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public var viewModel: DetailViewModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await setupView()
        }
    }
    
    func setupView() async {
        titleLabel.text = viewModel.item.value.title
        descriptionLabel.text = viewModel.item.value.description
        imageView.layer.cornerRadius = 10
        
        do {
            try await imageView.loadImage(viewModel.item.value.headerImageURL)
        } catch {
            print("could not load image")
        }
    }
}

