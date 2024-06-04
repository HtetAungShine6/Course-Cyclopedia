//
//  AdViewTest.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/6/1.
//

import SwiftUI
import AdmobSwiftUI

struct AdViewTest: View {
    
    // use this to test ads ca-app-pub-3940256099942544/1712485313
    
    @StateObject var nativeVM: NativeAdViewModel = NativeAdViewModel(
        adUnitID: "ca-app-pub-3940256099942544/1712485313",
        requestInterval: 120
    )
    private let adViewControllerRepresentable = AdViewControllerRepresentable()
    private let adCoordinator = InterstitialAdCoordinator()
    private let rewardCoordinator = RewardedAdCoordinator()
    @State private var earnedReward: Bool = false
    
    var body: some View {
        VStack{
            Text("Hello, World!")
            
            Button("Show reward InterstitialAd") {
                Task {
                    do {
                        let reward = try await rewardCoordinator.loadInterstitialAd()
                        reward.present(fromRootViewController: adViewControllerRepresentable.viewController) {
                            
                            print("Reward amount: \(reward.adReward.amount)")
                            
                            if Int(truncating: reward.adReward.amount) > 0{
                                earnedReward.toggle()
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            //MARK: Usage of show and hide button based on user watched ads
            NavigationLink(destination: {
                Text("View A")
            }, label: {
                Text("Go to View A")
            }).opacity(earnedReward ? 1.0 : 0.0)

            
            NativeAdView(nativeViewModel: nativeVM)
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                .onAppear {
                    nativeVM.refreshAd()
                }
                .padding()
            
            
        }
        .background {
            // Add the adViewControllerRepresentable to the background so it
            // doesn't influence the placement of other views in the view hierarchy.
            adViewControllerRepresentable
                .frame(width: .zero, height: .zero)
        }
    }
}

#Preview {
    AdViewTest()
}
