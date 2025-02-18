//
//  NivlCollectionViewCell.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit

class NivlCollectionViewCell: UICollectionViewCell {
    static let id = "nivlMainCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
 
    func configureWithItem(item: NivlItem) {
        
    }
    
}
