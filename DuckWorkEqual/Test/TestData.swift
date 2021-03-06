//
//  TestData.swift
//  DuckWorkEqual
//
//  Created by 권준상 on 2021/11/20.
//

import Foundation
import UIKit

struct TestData {
    static var questionList: [String] = ["공구를 사용하여 물건을 고친다", "실업률 증가 원인에 대해 연구한다", "창작활동을 한다", "사회적으로 소외된 사람들을 도와준다", "학교, 학급 및 클럽 등의 대표가 된다", "용돈이 들어오고 나가는 것을 꼼꼼히 기록한다", "화초나 식물을 재배한다", "물체의 운동법칙을 설명한다", "감정을 글로 표현한다", "성인이나 아동을 교육 시킨다", "학급을 대표하여 학생들의 의견을 잘 전달한다", "물건의 가격과 영수증 금액을 일일이 대조한다", "기계 장치를 조작한다", "경제성장요인의 관계를 분석한다", "시를 감상한다", "아픈 사람을 정성껏 간호한다", "소품이나 운동회 때 친구들을 잘 통솔 한다", "서류를 분류하고 정리한다", "범죄자를 추척한다", "수학의 원리를 탐구한다", "무대에서 공연을 한다", "사람의 기분을 잘 맞춘다", "사람들을 설득해서 물건을 사도록한다", "학급비 지출내용을 잘 정리한다"]
    static var checkList = [Int](repeating: 0, count: 24)
    static var level: Int = 1
    static var resultInfoList = [ResultInfo(feature: ["지적이고 분석적임", "호기심 많고 개방적임"], preferJobAction: "문제 해결을 위해 아이디어를 사용하고 정보를 분석하는 일 선호", type: "탐구형", example: "물리학자, 의학자, 수학자, 컴퓨터 프로그래머 등"), ResultInfo(feature: ["명랑하고 사교적임", "친절하고 이해심이 있음"], preferJobAction: "개인적인 교류를 통해서 타인을 도와주고 가르치고 상담해주고 봉사하는 활동을 선호", type: "사회형", example: "교사, 상담가, 사회복지사, 성직자 등")]
}

struct ResultInfo {
    var feature: [String]
    var preferJobAction: String
    var type: String
    var example: String
}
