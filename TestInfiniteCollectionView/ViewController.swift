//
//  ViewController.swift
//  TestInfiniteCollectionView
//
//  Created by Batuhan Baran on 8.03.2021.
//

import UIKit

class ViewController: UIViewController {

    var testViewArray: [UIView] = []
    var testColorArray: [UIColor] = [#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1),#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)]
    
    private var collectionView: UICollectionView = {
       
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            
            self.testViewArray.append(viewCreater())
        }
        
        configureCollectionView()
        print(self.testViewArray.count)
    }

    func configureCollectionView() {
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.frame = self.view.bounds
 
        self.collectionView.backgroundColor = .systemBackground
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }

    func viewCreater() -> UIView {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 25, height: 75))
        
        return myView
    }
    
    func loadMore() {
        
        for _ in 1...10 {
            
            self.testViewArray.append(viewCreater())
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testViewArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        let random = Int.random(in: 0...self.testColorArray.count - 1)
        
        cell.backView.backgroundColor = self.testColorArray[random]
        cell.backView.dropShadow(color: .black, offSet: CGSize(width: 0, height: 23))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        return CGSize.init(width: view.frame.width - 25, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height {
            
            self.loadMore()
            self.collectionView.reloadData()
            print(self.testViewArray.count)
            
        }
    }
}

