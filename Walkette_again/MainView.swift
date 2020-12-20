//
//  MainView.swift
//  Walkette_again
//
//  Created by 최유림 on 2020/12/19.
//

import MapKit
import AVFoundation
import SwiftUI

let shadowcolor = Color.black.opacity(0.16)

struct MainView: View {
    @State private var searchTerm: String = ""
    @State var isOnTap = false
    @State var searchBarHidden = false
    @State var isTracking = false
    @State var resultPageShowing = false
    
    var body: some View {
        ZStack {
            MapView().edgesIgnoringSafeArea(.all)
            
            Image("Canvas")
                .resizable()
                .scaledToFill()
                .frame(width: 414, height: 896, alignment: .center)
            
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            if isOnTap {
                LoopingPlayer()
                Image("statistic")
                    .animation(.easeInOut(duration: 10.0))
            }
            
            VStack {
                HStack {
                    NavigationLink(destination: MenuView()){
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 22.0, height: 19.0, alignment: .leading)
                            .foregroundColor(.black)
                    }

                    Spacer()
                    Text("Walkette")
                    .fontWeight(.semibold)
                    .font(.title3)
                    Spacer()
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 22.0, height: 19.0)
                        .opacity(0)
                }
                .padding(.horizontal, 30.0)
                .padding(.top, 65.0)
                
                if !searchBarHidden {
                    HStack {
                        SearchBar(text: $searchTerm)
                    }.padding(.horizontal, 20.0)
                }
                
                Spacer()

                if !isTracking && !resultPageShowing {
                    Text("Start Tracking")
                        .foregroundColor(.white)
                        .font(.title3)
                        .background(Image("Box_DarkGray"), alignment: .center)
                        .padding(.bottom, 110.0)
                        .onTapGesture {
                            isOnTap = true
                            searchBarHidden = true
                            isTracking = true
                        }
                } else if isTracking && !resultPageShowing {
                    Text("Stop")
                        .foregroundColor(.white)
                        .font(.title3)
                        .background(Image("Box_DarkGray"), alignment: .center)
                        .padding(.bottom, 110.0)
                        .onTapGesture {
                            isOnTap = false
                            searchBarHidden = false
                            isTracking = false
                            resultPageShowing = true
                        }
                }
            }
            
            if resultPageShowing {
                Image("popup")
                    .resizable()
                    .animation(.easeInOut(duration: 20.0))
                    .background(Color.black.opacity(0.7))
            }
            
        }.edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class SearchBarStyle: UISearchBar {
        override var searchBarStyle: UISearchBar.Style {
            get {
                return super.searchBarStyle
            }
            set {
                self.searchBarStyle = UISearchBar.Style.minimal
            }
        }
        
        override var barTintColor: UIColor? {
            get {
                return super.barTintColor
            }
            set {
                self.barTintColor = UIColor.black
            }
        }
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }

    
}

struct LoopingPlayer: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

class PlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let fileUrl = Bundle.main.url(forResource: "testVideo", withExtension: "mp4")
        let playerItem = AVPlayerItem(url: fileUrl!)
        
        // Setup Player
        let player = AVPlayer(playerItem: playerItem)
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Loop
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        // Play
        player.play()
    }
    
    @objc
    func rewindVideo(notification: Notification) {
        playerLayer.player?.seek(to: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
