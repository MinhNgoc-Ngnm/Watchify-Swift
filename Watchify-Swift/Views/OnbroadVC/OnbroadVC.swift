//
//  OnbroadVC.swift
//  Watchify-Swift
//
//  Created by Minh Ngọc on 08/02/2025.
//

import Foundation
import UIKit

class OnbroadVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var dataArray: [[String: String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let onbroadCollectionCellNib = UINib(nibName: "OnbroadCell", bundle: nil)
        collectionView.register(onbroadCollectionCellNib, forCellWithReuseIdentifier: "cell")
        dataArray = [
            [
                "title": "Xem hàng triệu video đặc sắc hấp dẫn",
                "image": "illus_splash_01",
                "des": "Đa dạng chủ đề Nhạc, Phim, TVShow, Tin Tức, Sao"
            ],
            [
                "title": "Phát sóng trực tiếp các sự kiện giải trí hot",
                "image": "illus_splash_02",
                "des": "Hội tụ top streamers, KOLs và giải đấu Esport đỉnh cao"
            ],
            [
                "title": "Đăng tải và chia sẻ video mọi lúc mọi nơi",
                "image": "illus_splash_03",
                "des": "Dễ dàng lưu trữ và chia sẻ video với bạn bè"
            ]
        ]
        pageControl.numberOfPages = dataArray.count
        pageControl.currentPage = 0
    }
    @IBAction func btnNextHandle(_ sender: UIButton) {
        let loginVC = LoginVC()
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.pushViewController(loginVC, animated: true)
    }
    @IBAction func pageControlTapHandle(_ sender: Any) {
        collectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
}


extension OnbroadVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? OnbroadCell else {
            return UICollectionViewCell()
        }
        let item = dataArray[indexPath.row]
        if let image = item["image"] {
            cell.image.image = UIImage(named: image)
        }
        cell.title.text = item["title"]
        cell.des.text = item["des"]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width;
        let page = (NSInteger)((scrollView.contentOffset.x + pageWidth/2) / pageWidth);
        pageControl.currentPage = page
      
    }
    
}
