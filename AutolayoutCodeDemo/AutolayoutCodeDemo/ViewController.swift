//
//  ViewController.swift
//  AutolayoutCodeDemo
//
//  Created by Robert Wong on 7/9/18.
//  Copyright © 2018 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //{} is a closure/anon function
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
       let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string:"\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you soon in one of our stores!", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //make sure you apply the right encapsulation principles in my classes
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
       let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        setupBottomControls()
        setupLayout()
    }
    
    fileprivate func setupBottomControls() {
        //view.addSubview(previousButton)
        
//        NSLayoutConstraint.activate([previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), previousButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), previousButton.heightAnchor.constraint(equalToConstant: 50)])
        
//        let yellowView = UIView()
//        yellowView.backgroundColor = .yellow
        
//        let greenView = UIView()
//        greenView.backgroundColor = .green
        
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor), bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    private func setupLayout() {
        //always need 4 constraints to make sure the view is placed x, y, height and width
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}
