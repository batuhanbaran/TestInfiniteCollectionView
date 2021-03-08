//
//  CollectionViewCell.swift
//  TestInfiniteCollectionView
//
//  Created by Batuhan Baran on 8.03.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "collectionViewCell"
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        backView.layer.cornerRadius = 16
        backView.layer.masksToBounds = true

    }

}
