//
//  FeedViewController.swift
//  Marslink
//
//  Created by Shabir Jan on 09/02/2017.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit
import IGListKit
class FeedViewController: UIViewController {

    let pathFinder = Pathfinder()
    
    lazy var adapater: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController:self, workingRangeSize:0)
    }()
    
    let collectionView: IGListCollectionView = {
        let view = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .black
        return view
    }()
    
    let loader = JournalEntryLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loader.loadLatest()
        view.addSubview(collectionView)
        adapater.collectionView = collectionView
        adapater.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    

}
extension FeedViewController : IGListAdapterDataSource{
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        var items:[IGListDiffable] = pathFinder.messages
        items += loader.entries as [IGListDiffable]
        return items
    }
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if object is Message{
            return MessagesSectionController()
        }else{
            return JournalSectionController()
        }
       
    }
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}

