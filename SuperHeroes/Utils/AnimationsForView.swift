//
//  AnimationsForView.swift
//  SuperHeroes
//
//  Created by Tardes on 19/12/24.
//

import UIKit

extension UIView{


    func bounce(){
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations:{
                self.transform = .identity
            })
        }
    }
    
    func shine(){
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0.2
        }) { (completion) in
            UIView.animate(withDuration: 0.5, animations:{
                self.alpha = 1
            })
        }
    }
    
    func jumpHorizontal(){
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(translationX: 25, y:0)
        }) { (completion) in
            UIView.animate(withDuration: 0.5, animations:{
                self.transform = .identity
            })
        }
    }
    

}
