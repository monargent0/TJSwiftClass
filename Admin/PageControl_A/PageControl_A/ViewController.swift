//
//  ViewController.swift
//  PageControl_A
//
//  Created by tj on 2022/09/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.png","flower_02.png","flower_03.png","flower_04.png","flower_05.png","flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // pageControl Setting
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.cyan
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

