//
//  MainTabBarController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/24.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    var flag = false
    
    func setTabBar() {
        let recommendNVC = UINavigationController(rootViewController: RecommendEnterpriseViewController())
        let communityVC =  UINavigationController(rootViewController:CommunityViewController())
        let myPageNVC = UINavigationController(rootViewController: MyPageViewController())
        self.tabBar.tintColor = .colorWithRGBHex(hex: 0x969799)
      
        self.setViewControllers([recommendNVC, communityVC, myPageNVC], animated: false)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["enterprise","community","mypage"]
        let titles = ["기업 찾기", "커뮤니티", "내 정보"]
        
        for i in 0...2 {
            items[i].image = UIImage(named: images[i])
            items[i].title = titles[i]
        }
        
    }

}
