//
//  NoticeHeaderView.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/25.
//

import UIKit
import SnapKit

class NoticeHeaderView: UITableViewHeaderFooterView {

    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "[공지] 자유로운 대화를 나누어 보세요!"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let additionalSeparator: UIView = {
        let seperator = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: CGFloat(1.0)))
        seperator.backgroundColor = UIColor.colorWithRGBHex(hex: 0xF4F3F3)
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
        contentView.addSubview(noticeLabel)
        contentView.addSubview(additionalSeparator)
    }

    private func setConstraints() {
        contentView.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        
        noticeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(15)
        }
        
        additionalSeparator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
