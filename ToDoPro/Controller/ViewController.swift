//
//  ViewController.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var taskCollectionView: UICollectionView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var quatationLabel: UILabel!
    @IBOutlet weak var datedisplayLabel: UILabel!
    @IBOutlet var backgroundview: GradientView!

    
    //MARK: - Variables
    
    var selectedImage: UIView?
    var  originalframe  = CGRect.zero
    var transition = PopAnimator()
    var taskcategory =  [TaskCategory]()

    
    //MARK: - Segue ID
    
    struct Storyboard  {
        static let  taskdetailSegueID = "taskdetailsSegueID"
    }
    
    
    //MARK: - App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetups()
        taskCollectionView.delegate = self
        taskCollectionView.dataSource = self
        taskcategory = TaskCategoryHandler.shared.fetchcategoryDetails()
        transition.dismissCompletion = {
            self.taskCollectionView.reloadData()
        }
        self.taskCollectionView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.taskCollectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    //MARK: - Funtions
    
    func initialSetups() {
        self.datedisplayLabel.text = DateMonthHelper().getcurrentdateString()
        self.quatationLabel.text = Quotes().getRandomQuatoes()
    }

    
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.taskdetailSegueID{
            let taskdetailsVC  = segue.destination as! TaskdetailsViewController
            taskdetailsVC.transitioningDelegate = self
            taskdetailsVC.taskCategory = sender as? TaskCategory
        }
    }
    
}


    //MARK: - Collection view delegate and data source

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskcategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCollectionViewCell", for: indexPath) as! TaskCollectionViewCell
        let taskcategoryDetails = taskcategory[indexPath.row]
        cell.setupsTaskDetails(category: taskcategoryDetails)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 60 , height: collectionView.frame.size.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let taskdetails = taskcategory[indexPath.row]
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
        let cellRectInSV = collectionView.convert( attributes.frame, to: collectionView.superview)
        originalframe = CGRect(x: cellRectInSV.origin.x + 20, y: cellRectInSV.origin.y + 5, width: cellRectInSV.size.width-25, height: cellRectInSV.size.height - 10)
        
        self.performSegue(withIdentifier: Storyboard.taskdetailSegueID, sender: taskdetails)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if taskcategory.count > 0 {
            let visibleRect = CGRect(origin: self.taskCollectionView.contentOffset, size: self.taskCollectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            let visibleIndexPath = self.taskCollectionView.indexPathForItem(at: visiblePoint)
            self.backgroundview.updatebackgroundcolor(indexno: (visibleIndexPath?.row) ?? 0)
        }
    }
}


//MARK: - Transitioning Delegate

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = originalframe
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}

