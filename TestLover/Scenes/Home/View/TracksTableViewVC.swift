//
//  TracksTableViewVC.swift
//  Storm
//
//  Created by Mohammad Zakizadeh on 7/21/18.
//  Copyright © 2018 Storm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class TracksTableViewVC: UIViewController {
    
    
    @IBOutlet private weak var tracksTableView: UITableView!
    
    
    public var tracks = PublishSubject<[Track]>()
    
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }
    
    
    private func setupBinding(){
        
        tracksTableView.register(UINib(nibName: "TracksTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: TracksTableViewCell.self))
        
        tracks.bind(to: tracksTableView.rx.items(cellIdentifier: "TracksTableViewCell", cellType: TracksTableViewCell.self)) {  (row,track,cell) in
            cell.cellTrack = track
            }.disposed(by: disposeBag)
        
        tracksTableView.rx.willDisplayCell
            .subscribe(onNext: ({ (cell,indexPath) in
                cell.alpha = 0
                let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
                cell.layer.transform = transform
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
                }, completion: nil)
            })).disposed(by: disposeBag)
    }
}




