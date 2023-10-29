//
//  DetailViewController.swift
//  TableViewApp
//
//  Created by kraujalis.rolandas on 28/10/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var movieURLButton: UIButton!
    
    var song: Song?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutChanges()
    }
    
    func layoutChanges() {
        if let mainSong = song {
            movieURLButton.isHidden = true
            trackImageView.widthAnchor.constraint(equalToConstant: CGFloat(300)).isActive = true
            trackImageView.heightAnchor.constraint(equalToConstant: CGFloat(300)).isActive = true
            for constraint in self.view.constraints {
                if constraint.identifier == "InfoLabelBotConstraint"{
                    constraint.constant = 150
                }
            }
            trackNameLabel.font = trackNameLabel.font.withSize(18)
            trackImageView.image = UIImage(named: mainSong.cover)
            trackNameLabel.text = "\(mainSong.track)\n\(mainSong.album)"
        }
        
        if let mainMovie = movie {
            movieURLButton.isHidden = false
            trackImageView.layer.borderWidth = 10
            trackImageView.layer.borderColor = UIColor.gray.cgColor
            trackImageView.widthAnchor.constraint(equalToConstant: CGFloat(182)).isActive = true
            trackImageView.heightAnchor.constraint(equalToConstant: CGFloat(268)).isActive = true
            trackImageView.image = UIImage(named: mainMovie.image)
            trackNameLabel.text = "\(mainMovie.title)\n\(mainMovie.year)\n\(mainMovie.genre)\n\(mainMovie.description)"
            movieURLButton.setTitle(mainMovie.trailerURL, for: .normal)
        }
    }
    

    @IBAction func youtubeButtonPressed(_ sender: Any) {
        if let title = movieURLButton.titleLabel?.text {
            var youtubeURL = URL(string: title)
            if UIApplication.shared.canOpenURL(youtubeURL!) {
                UIApplication.shared.openURL(youtubeURL!)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
