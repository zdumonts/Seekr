//
//  ProfileView.swift
//  FirebaseTest
//
//  Created by Taya Ambrose on 10/18/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.white))
                            .frame(width: 72, height: 72)
                            .background(Color(.blue.opacity(0.7)))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor: .accentColor)
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("Account") {
                    Button {
                        print("Sign out")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Sign out",
                                        tintColor: .accentColor)
                    }
                    
                    Button {
                        print("Delete account")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill",
                                        title: "Delete account",
                                        tintColor: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}