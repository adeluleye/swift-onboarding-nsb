//
//  PageCell.swift
//  user-walk-through-demo
//
//  Created by ADELU ABIDEEN ADELEYE on 10/9/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let topImageContainerView: UIView = {
        let view = UIView(frame: .zero)
        // view.backgroundColor = .blue
        return view
    }()
    
    private let bearImageView: UIImageView = {
        let image = UIImage(named: "bear_first")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today at Prepa and be part of our network", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for fun way of learning and pass your examination in one sitting using our platform", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // backgroundColor = .purple
        setupViews()
        
    }
    
    func setupViews() {
        
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        
        topImageContainerView.addSubview(bearImageView)
        
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.setAnchor(top: topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 0, right: rightAnchor, rightPad: 0, height: 0, width: 0)
        
        
        bearImageView.translatesAutoresizingMaskIntoConstraints = false
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        
        
        descriptionTextView.setAnchor(top: topImageContainerView.bottomAnchor, topPad: 20, bottom: nil, bottomPad: 0, left: leftAnchor, leftPad: 16, right: rightAnchor, rightPad: 16, height: 0, width: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
