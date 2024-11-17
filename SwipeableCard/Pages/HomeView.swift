//
//  HomeView.swift
//  SwipeableCard
//
//  Created by Đoàn Văn Khoan on 17/11/24.
//

import SwiftUI
import BigUIPaging
import Kingfisher

struct HomeView: View {
    
    @State private var selection: Int = 0
    var userDatas: [UserResponse] = userData
    
    var body: some View {
        NavigationStack {
            VStack {
                PageView(selection: $selection) {
                    ForEach(userDatas.indices, id: \.self) { index in
                        CardTinderView(card: userDatas[index])
                    }
                }
                .pageViewStyle(.cardDeck)
                .pageViewCardCornerRadius(20)
                .background(.clear)
                .onChange(of: selection) { oldValue, newValue in
                    if (newValue == (userDatas.count - 1)) {
                        print("Last item")
                    }
                }
                
                VStack(spacing: 30) {
                    Text("\(userDatas[selection].namePlant)")
                        .font(.title3)
                        .foregroundStyle(Color.iconColor)
                        .bold()
                    
                    HStack(spacing: 20) {
                        ZStack {
                            KFImage(URL(string: userDatas[selection].userUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: .init(lineWidth: 2))
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white)
                                .shadow(radius: 2, x: 2, y: 2)
                        }
                        
                        Text(userDatas[selection].nameOwner)
                            .bold()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "leaf.fill")
                            .font(.largeTitle)
                            .foregroundStyle(Color.iconColor)
                        
                        Text("LatteFriends")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.iconColor)
                    }
                }
            }
        }
    }
}

struct CardTinderView: View {
    var size = UIScreen.main.bounds
    var card: UserResponse
    var body: some View {
        ZStack {
            KFImage(URL(string: card.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(
                    .rect(cornerRadius: 20)
                )
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: .init(lineWidth: 10))
                .foregroundStyle(.white)
                .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    HomeView()
}
