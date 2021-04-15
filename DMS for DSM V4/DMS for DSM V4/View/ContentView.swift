//
//  ContentView.swift
//  DMS for DSM V4
//
//  Created by DohyunKim on 2021/03/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabbedView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabbedView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(named: "CustomTabbar")
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 155/255, green: 220/255, blue: 220/255, alpha: 1)
    }
    var body: some View {
        
        return TabView {
            MealView()
                .tabItem {
                    Image("icon_meal")
                    Text("급식")
            }
            CalendarView()
                .tabItem {
                    Image("icon_event")
                    Text("일정")
            }
            ApplyView()
                .tabItem {
                    Image("icon_apply")
                    Text("신청")
            }
            ChatView()
                .tabItem {
                    Image("icon_chat")
                    Text("채팅")
            }
            MypageView()
                .tabItem {
                    Image("icon_id")
                    Text("마이페이지")
            }
        }
        .font(.headline)
        .accentColor(Color.white)
    }
}


