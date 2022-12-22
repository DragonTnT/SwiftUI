//
//  ContentView.swift
//  NetEaseAPI
//
//  Created by Allen long on 2022/12/21.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    var body: some View {
            ZStack(alignment: .center) {
                Image("playing_page_cover")
                    .resizable()
                    .scaledToFill()
                    .frame(width: kScreenW, height: kScreenH)
                    .blur(radius: 50)


                VStack(spacing: 0) {
                    // 导航栏
                    Color.blue
                        .frame(height: 44)
                        .padding(.top, statusBarH)
                    // 唱片模块
                    ZStack(alignment: .top) {
                        // 唱片
                        ZStack() {
                            Image("playing_page_disc")
                                .resizable()
                                .scaledToFill()
                                .frame(width: discWidth, height: discWidth)
                            Image("playing_page_cover")
                                .resizable()
                                .scaledToFill()
                                .frame(width: discWidth - discThickness * 2, height: discWidth - discThickness * 2)
                                .cornerRadius((discWidth - discThickness * 2)/2.0)
                        }
                        .padding(.top, 120)
                        // 唱片杆儿
                        Image("playing_page_needle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 122, height: 180)
                            .padding(.top, 15)
                            .padding(.leading, adapter(85))
                    }
                    Spacer()
                    // 控制台
                    VStack {
                        HStack() {
                            Spacer()
                            Image("playing_like")
                            Spacer()
                            Image("playing_download")
                            Spacer()
                            Image("playing_comment")
                            Spacer()
                        }
                    }
                    .frame(height: 200)
                    
                }
            }.ignoresSafeArea()
    }
    
    
    func loadSong() {
        let url = "http://m8.music.126.net/20221221150034/1ae4ed480c4fd4c66dfd8d5630996c06/ymusic/c48c/fb99/1950/a0634034446f904929e37dc2686ba91b.mp3"
        
        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("song.mp3")

            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        AF.download(url, to: destination).response { response in
            debugPrint(response)
            debugPrint(response.fileURL)
//            if response.error == nil, let imagePath = response.fileURL?.path {
//                let image = UIImage(contentsOfFile: imagePath)
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

fileprivate let discWidth: CGFloat = kScreenW - 80
fileprivate let discThickness: CGFloat = 40
