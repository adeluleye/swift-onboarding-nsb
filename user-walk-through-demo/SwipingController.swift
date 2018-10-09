//
//  SwipingController.swift
//  user-walk-through-demo
//
//  Created by ADELU ABIDEEN ADELEYE on 10/9/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join us today at Prepa and be part of our network", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon"),
        Page(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have"),
        Page(imageName: "leaf_third", headerText: "VIP members special services", bodyText: "vip members will have access to other products at a very reduced rate and this is the best offer you can get from our store, so join the vip club today!")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "PREV", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.red]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "NEXT", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.blue]))
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        
        print("next")
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    @objc private func handlePrevious() {
        print("previous")
        let prevIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .orangeColor
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    func setupBottomControls() {
        
        let stackView = view.createStackView(views: [previousButton,
                                                pageControl,
                                                nextButton])
        
        view.addSubview(stackView)
        
        stackView.setAnchor(top: nil, topPad: 0, bottom: view.safeBottomAnchor, bottomPad: 0, left: view.safeLeftAnchor, leftPad: 16, right: view.safeRightAnchor, rightPad: 16, height: 0, width: 0)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
        // print(x, view.frame.width, x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.isPagingEnabled = true
        
        setupBottomControls()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        
        //cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
