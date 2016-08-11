//
//  ViewController.swift
//  YXJCycleView
//
//  Created by yuanxiaojun on 16/8/10.
//  Copyright © 2016年 袁晓钧. All rights reserved.
//

import UIKit
import YXJCycleView

var ScreenWidth: CGFloat {
    return UIScreen.mainScreen().bounds.width
}

class ViewController: UIViewController, YXJCycleScrollViewDelegate {

    private var cycleView: YXJCycleScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()

        /**
         方式一
         */
        loadLocalImg()

        /**
         方式二
         */
        loadLocalView()

        /**
         方式三
         */
        loadURLImg()
    }

    /**
     加载本地图片，使用场景，做静态展示或者app首次安装或者更新的介绍页
     */
    func loadLocalImg() {
        self.cycleView = YXJCycleScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
        self.view.addSubview(self.cycleView!)
        self.cycleView?.backgroundColor = UIColor.whiteColor()
        self.cycleView?.autoScroll = false
        self.cycleView?.infiniteLoop = false
        self.cycleView?.delegate = self
        self.cycleView?.localizationImagesGroup = [UIImage.init(named: "init1")!, UIImage.init(named: "init2")!, UIImage.init(named: "init3")!, UIImage.init(named: "init4")!, UIImage.init(named: "init5")!]
        self.cycleView?.pageControl.dotColor = UIColor.whiteColor()
    }

    /**
     加载本地任意view
     */
    func loadLocalView() {
        self.cycleView = YXJCycleScrollView(frame: CGRect(x: 0, y: 160, width: ScreenWidth, height: 150))
        self.view.addSubview(self.cycleView!)
        self.cycleView?.backgroundColor = UIColor.whiteColor()
        self.cycleView?.autoScroll = false
        self.cycleView?.infiniteLoop = false
        self.cycleView?.delegate = self

        let v1 = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
        v1.backgroundColor = UIColor.brownColor()
        let v2 = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
        v2.backgroundColor = UIColor.purpleColor()
        let v3 = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
        v3.backgroundColor = UIColor.orangeColor()
        let v4 = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 150))
        v4.backgroundColor = UIColor.magentaColor()

        self.cycleView?.views = [v1, v2, v3, v4]
        self.cycleView?.pageControl.dotColor = UIColor.whiteColor()
    }

    /**
     加载网络图片
     */
    func loadURLImg() {
        self.cycleView = YXJCycleScrollView(frame: CGRect(x: 0, y: 320, width: ScreenWidth, height: 150))
        self.view.addSubview(self.cycleView!)
        self.cycleView?.backgroundColor = UIColor.whiteColor()
        self.cycleView?.autoScroll = true
        self.cycleView?.autoScrollTimeInterval = 3
        self.cycleView?.infiniteLoop = true
        self.cycleView?.delegate = self
        self.cycleView?.pageControlAliment = YXJCycleScrollViewPageContolAlimentRight
        self.cycleView?.imageURLStringsGroup = [
            "http://p0.so.qhmsg.com/bdm/326_204_/t011d35badee89c184a.jpg",
            "http://p3.so.qhmsg.com/bdm/326_204_/t01d5cd3cd467db8b4d.jpg",
            "http://p1.so.qhmsg.com/bdm/326_204_/t014986d9bc787ba0e1.jpg",
            "http://p3.so.qhmsg.com/bdm/326_204_/t012e2e252b709019e3.jpg"
        ]
        self.cycleView?.titlesGroup = [
            "第一张图片的描述",
            "第二张图片的描述",
            "第三张图片的描述",
            "第四张图片的描述"
        ]
        self.cycleView?.pageControl.dotColor = UIColor.whiteColor()
    }

    // MARK:cycle
    func cycleScrollView(cycleScrollView: YXJCycleScrollView!, didSelectItemAtIndex index: Int) {
        print(index)
    }
    func cycleScrollView(cycleScrollView: YXJCycleScrollView!, didSwipeItemAtIndex index: Int) {
        print(index)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

