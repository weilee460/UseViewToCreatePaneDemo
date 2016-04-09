//
//  ViewController.swift
//  UseViewToCreatePane
//
//  Created by ying on 16/4/9.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //游戏方格维度
    var dimension:Int = 4
    
    //数字格子的宽度
    var width:CGFloat = 0
    //格子与格子的间距
    var padding:CGFloat = 6
    //格子与屏幕左右两边的距离
    var distanceFromeLeftAndRightSide: CGFloat = 12
    //格子与屏幕左右两边的距离
    var distanceFromeBottomSide: CGFloat = 20
    
    //保存背景图数据
    var backgrounds:Array<UIView>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.backgrounds = Array<UIView>()
        //改成主视图背景白色背景
        self.view.backgroundColor = UIColor.whiteColor()
        width = caculateTitleWidth()
        setupGameMap()
    }
    
    func caculateTitleWidth() -> CGFloat
    {
        return (self.view.bounds.width - 2 * distanceFromeLeftAndRightSide - (CGFloat(dimension) - 1) * padding) / CGFloat(dimension)
    }
    
    func caculateTitleYLeftUpsideCoordinate() -> CGFloat
    {
        let leftUpsideYCoordinate =  self.view.bounds.height - distanceFromeBottomSide - (self.view.bounds.width - 2 * distanceFromeLeftAndRightSide)
        return leftUpsideYCoordinate
    }
    
    func setupGameMap()
    {
        var x:CGFloat = distanceFromeLeftAndRightSide
        var y:CGFloat = 0
        
        for i in 0 ..< dimension
        {
            y = caculateTitleYLeftUpsideCoordinate()
            for j in 0 ..< dimension
            {
                //初始化视图
                var background = UIView(frame:CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                //将视图保存起来，以备后用
                backgrounds.append(background)
                y += padding + width
            }
            x += padding+width
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

