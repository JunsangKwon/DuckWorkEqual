//
//  ResultTableViewHeader.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/22.
//

import UIKit
import SnapKit

class ResultHeaderView: UITableViewHeaderFooterView {
    static let identifier = "ResultHeaderView"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let rightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "right-arrow")
        return imageView
    }()
    
    private let additionalSeparator: UIView = {
        let seperator = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat(1.0)))
        seperator.backgroundColor = UIColor.colorWithRGBHex(hex: 0x969799)
        return seperator
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initSectionHeaderView()
        setLayouts()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("coder doesn't exist")
    }

    private func initSectionHeaderView() {
        contentView.backgroundColor = .white
    }

    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }

    private func setViewHierarchy() {
        contentView.addSubview(rightImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(additionalSeparator)
    }

    private func setConstraints() {
        contentView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        
        rightImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(17)
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(rightImageView)
            $0.leading.equalTo(rightImageView.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        additionalSeparator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }
    }

    public func setTitleText(title: String) {
        titleLabel.text = title
    }
}
