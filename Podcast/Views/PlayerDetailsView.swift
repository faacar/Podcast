//
//  PlayerDetailsView.swift
//  Podcast
//
//  Created by Ahmet Acar on 25.10.2020.
//  Copyright © 2020 Ahmet Acar. All rights reserved.
//

import UIKit
import SDWebImage
import AVKit

class PlayerDetailsView: UIView {
    
    var episode: Episode! {
        didSet {
            episodeTitleLabel.text = episode.title
            episodeAuthorLabel.text = episode.author
            
            playEpisode()
            
            guard let url = URL(string: episode.imageURL ?? "") else { return }
            episodeImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    
    fileprivate func playEpisode() {
        print("Trying to play episode at url:", episode.streamURL)
        guard let url = URL(string: episode.streamURL) else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    fileprivate func enlargeEpisodeImageView() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.episodeImageView.transform = .identity // back to the original position
        }, completion: nil)
    }
    
    fileprivate func shrinkEpisodeImageView() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.episodeImageView.transform = self.shrunkenTransform
        }, completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let time = CMTime(value: 1, timescale: 3)
        let times = [NSValue(time: time)]
        player.addBoundaryTimeObserver(forTimes: times, queue: .main) {
            print("Episode started playing")
            self.enlargeEpisodeImageView()
        }
    }
    fileprivate let shrunkenTransform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    
    //MARK: -IB Actions and Outlets
    
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeAuthorLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var episodeImageView: UIImageView! {
        didSet {
            episodeImageView.layer.cornerRadius = 9
            episodeImageView.transform = shrunkenTransform
        }
    }
   
    @IBAction func handleDismissButton(_ sender: Any) {
        self.removeFromSuperview()
        enlargeEpisodeImageView()
    }
    
    @IBAction func playPauseButtonClicked(_ sender: Any) {
        print("Trying to play and pause clicked")
        if player.timeControlStatus == .playing {
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            shrinkEpisodeImageView()

        } else {
            player.play()
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            enlargeEpisodeImageView()
        }
    }
}
