//
//  ViewController.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/17.
//

import UIKit
import SnapKit
import KakaoSDKAuth
import KakaoSDKUser

class SignInViewController: UIViewController {
    
    let sceneDelegate = UIApplication.shared.connectedScenes
            .first!.delegate as! SceneDelegate
    var didUserTakeTest = UserDefaults.standard.bool(forKey: SignInViewController.testKey)
    static var testKey = "takeTest"
    
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "duckLogo")
    }

    let kakaoSignInView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .colorWithRGBHex(hex: 0xF7E600)
    }
    
    let naverSignInView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .colorWithRGBHex(hex: 0x1DC121)
    }
    
    let kakaoLogoImageView = UIImageView().then {
        $0.image = UIImage(named: "kakaoicon")
    }
    
    let naverLogoImageView = UIImageView().then {
        $0.image = UIImage(named: "naver")
    }
    
    let kakaoViewLabel = UILabel().then {
        $0.text = "카카오 계정 로그인"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = UIColor.black
    }
    
    let naverViewLabel = UILabel().then {
        $0.text = "네이버 계정 로그인"
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavBar()
        setLayouts()
        addGesture()
        setUserDefault()
    }
    
    func setNavBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func addGesture() {
        let kakaoViewTap = UITapGestureRecognizer(target: self, action: #selector(kakaoSignInButtonDidTap))
        kakaoSignInView.addGestureRecognizer(kakaoViewTap)
        kakaoSignInView.isUserInteractionEnabled = true
    }
    
    func setUserDefault() {
        UserDefaults.standard.register(defaults: [SignInViewController.testKey : false])
//        UserDefaults.standard.setValue(false, forKey: SignInViewController.testKey)
    }
    
    @objc func kakaoSignInButtonDidTap(sender: UITapGestureRecognizer) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                _ = oauthToken
                self.setUserInfo()
                if self.didUserTakeTest {
                    self.sceneDelegate.window?.rootViewController = MainTabBarController()
                } else {
                    let vc = StartTestViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    func setUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            } else {
                print("me() success.")
            }
            _ = user
            
        }
    }

    func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy() {
        view.addSubviews(logoImageView, kakaoSignInView, naverSignInView)
        kakaoSignInView.addSubviews(kakaoLogoImageView, kakaoViewLabel)
        naverSignInView.addSubviews(naverLogoImageView, naverViewLabel)
    }

    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(guide).offset(150)
            $0.width.equalTo(315)
            $0.height.equalTo(315)
        }
        
        kakaoSignInView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(45)
        }
        
        kakaoLogoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
            $0.centerY.equalToSuperview()
        }
        
        kakaoViewLabel.snp.makeConstraints {
            $0.leading.equalTo(kakaoLogoImageView.snp.trailing).offset(50)
            $0.centerY.equalToSuperview()
        }
        
        naverSignInView.snp.makeConstraints {
            $0.top.equalTo(kakaoSignInView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(45)
        }
        
        naverLogoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(40)
            $0.height.equalTo(40)
            $0.centerY.equalToSuperview()
        }
        
        naverViewLabel.snp.makeConstraints {
            $0.leading.equalTo(naverLogoImageView.snp.trailing).offset(45)
            $0.centerY.equalToSuperview()
        }
    }

}

