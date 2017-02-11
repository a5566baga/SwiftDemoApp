//
//  ViewController.swift
//  LiveLife
//
//  Created by ben on 16/11/3.
//  Copyright © 2016年 张增强. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    
    @IBOutlet weak var loveBtn: UIButton!
    @IBOutlet weak var giftBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var bgView: UIImageView!
    
    var live : YKCell!
    var playerView:UIView!
    var ijkPlayer:IJKMediaPlayback!
    var heartView:DMHeartFlyView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setBgPic()
        setPlayerView()
        preparButton()
    }
    //设置背景图片
    func setBgPic() -> Void {
         let imgUrl = URL(string: "http://img.meelive.cn/" + live.portrait)
        bgView.kf.setImage(with: imgUrl)
        
        let blueEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blueEffect)
        effectView.frame = bgView.bounds
        bgView.addSubview(effectView)
        
    }
    //讲按钮放在最前面
    func preparButton() -> Void {
        view.bringSubview(toFront: loveBtn)
        view.bringSubview(toFront: giftBtn)
        view.bringSubview(toFront: backBtn)

    }
    //设置播放视图
    func setPlayerView() -> Void{
        self.playerView = UIView(frame: view.bounds)
        view.addSubview(self.playerView)
        
        ijkPlayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
        let pv = ijkPlayer.view!
        
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerView.insertSubview(pv, at: 1)
        ijkPlayer.scalingMode = .aspectFill
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !self.ijkPlayer.isPlaying(){
            ijkPlayer.prepareToPlay()
        }
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        ijkPlayer.shutdown()
        _ = self.navigationController?.popViewController(animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func loveAction(_ sender: UIButton) {
        heartView = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        heartView.center = CGPoint(x: loveBtn.center.x, y: loveBtn.center.y)
        heartView.animate(in: view)
        view.addSubview(heartView)
        
        //爱心关键帧的特效
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnime.values = [1.0, 0.7, 0.5, 0.3, 0.5, 0.7, 1.2, 1.4, 1.2, 1.0]
        btnAnime.keyTimes = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        btnAnime.duration = 0.2
        sender.layer.add(btnAnime, forKey: "SHOW")
    }
    
    @IBAction func giftAction(_ sender: UIButton) {
        let durationTime = 3.0
        let carView = UIImageView(image: #imageLiteral(resourceName: "porsche"))
        carView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(carView)
        
        let heightCar:CGFloat = 125.0
        let widthCar:CGFloat = 250.0
        UIView.animate(withDuration: durationTime , animations: {
            carView.frame = CGRect(x: self.view.center.x - widthCar/2, y: self.view.center.y - heightCar/2, width: widthCar, height: heightCar)
        }, completion: { (completed) in
            UIView.animate(withDuration: durationTime, animations: { 
                
            })
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + durationTime){
            UIView.animate(withDuration: durationTime, animations: {
                carView.frame = CGRect(x: self.view.frame.size.height, y: self.view.frame.size.width, width: widthCar, height: heightCar)
                carView.alpha = 0
            }, completion: { (completed) in
                carView.removeFromSuperview()
            })
        }
        //烟花
        let spark = CAEmitterLayer()
        view.layer.addSublayer(spark)
        emmitParticles(from: sender.center, emitter: spark, in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2*durationTime) {
            spark.removeFromSuperlayer()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

