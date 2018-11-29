//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Chen Wang on 12/15/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank
{
    var list = [Question]()

    init()
    {
        list.append(Question(text: "我的生日是什么时候？",correctAnswer: 1, c1:"10/29/1995", c2:"08/29/1995", c3:"06/12/1995" ))
        list.append(Question(text: "我养了什么？",correctAnswer: 2, c1:"狗", c2:"猫", c3:"金鱼" ))
        list.append(Question(text: "我喜欢什么乐器？",correctAnswer: 3, c1:"小提琴", c2:"钢琴", c3:"吉他" ))
        list.append(Question(text: "今年做过最开心的事？",correctAnswer: 4, c1:"和你一起旅游", c2:"和你去阿拉斯加", c3:"认识你" ))
        list.append(Question(text: "你现在的心情？",correctAnswer: 4, c1:"开心", c2:"无奈", c3:"无法描述" ))
        list.append(Question(text: "猜猜我现在最想要什么？",correctAnswer: 5, c1:"一个吻", c2:"免单", c3:"认识你的朋友" ))
    }
}
