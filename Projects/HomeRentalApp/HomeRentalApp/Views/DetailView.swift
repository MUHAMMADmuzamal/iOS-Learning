//
//  DetailView.swift
//  HomeRentalApp
//
//  Created by Codes Orbit on 06/01/2024.
//

import SwiftUI

struct DetailView: View {
    let model: DetailModel = DetailModel(image: "house",
                                         name: "Orchad House",
                                         description: "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... Show More", location: "Jl. Sultan Iskandar Muda, Jakarta selatan", rent: "2.500.000.000", bedRooms: 6, bathRooms: 4)
    var body: some View {
        VStack{
            ImageView(model: model)
            description
            contactInfo
            gallery
            mapView
            
        }
        .toolbar(.hidden)
    }
    
    private var description:  some View {
        VStack(alignment: .leading){
            Text("Description")
                .font(.setRalewayFont(size: 17, weight: .medium))
            Spacer()
            Text("The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... Show More")
                .foregroundColor(.gray85)
                .font(.setRalewayFont(size: 12, weight: .regular))
        }
        .frame(width:358, height: 80)
    }
    
    private var contactInfo: some View {
        HStack{
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 42, height: 42)
                .clipShape(
                    Circle()
                )
            Spacer()
                .frame(width: 17)
            VStack(alignment: .leading){
                Text("Garry Allen")
                    .font(.setRalewayFont(size: 17, weight: .medium))
                Text("Owner")
                    .foregroundColor(.gray85)
                    .font(.setRalewayFont(size: 12, weight: .regular))
            }
            Spacer()
            
            Image(systemName: "phone.fill")
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.skyBlueD9.opacity(0.50))
                        .frame(width: 30, height: 30)
                )
                .foregroundColor(.white)
            Spacer()
                .frame(width: 17)
            Image(systemName: "message.fill")
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.skyBlueD9.opacity(0.50))
                        .frame(width: 30, height: 30)
                )
                .foregroundColor(.white)
            
            
        }
        .padding()
    }
    
    private var gallery: some View {
        VStack(alignment: .leading){
            Text("Gallery")
                .font(.setRalewayFont(size: 17, weight: .medium))
            Spacer()
            HStack(spacing: 17){
                galleryImage
                galleryImage
                galleryImage
                galleryImage
                    .overlay(
                        Text("+5")
                            .foregroundColor(.white)
                            .font(.setRalewayFont(size: 21, weight: .medium))
                            .background(Color.black.opacity(0.30))
                    )
            }
            
            
        }
        .frame(width:358, height:118)
    }
    
    private var galleryImage: some View {
        Image("room")
            .resizable()
            .cornerRadius(10)
            .frame(width: 76, height: 76)
    }
    
    private var mapView: some View {
        
        Image("map")
            .resizable()
            .cornerRadius(21)
            .overlay(LinearGradient(colors: [.white.opacity(0.30),.white], startPoint: .top, endPoint: .bottom))
            .overlay(alignment: .bottom){
                HStack{
                    VStack(alignment: .leading){
                        Text("Price")
                            .foregroundColor(.gray85)
                            .font(.setRalewayFont(size: 12, weight: .regular))
                        Spacer()
                        Text("Rp. 2.500.000.000 / Year")
                            .font(.setRalewayFont(size: 17, weight: .medium))
                    }
                    .frame(height: 40)
                    Spacer()
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Gradient.oceanBlue)
                        .overlay(
                            Text("Rent Now")
                                .foregroundColor(.white)
                                .font(.setRalewayFont(size: 17, weight: .semibold))
                        )
                        .frame(width: 130, height: 45)
                }
            }
               
            .frame(width:358, height: 160)
            .padding()
  
        
        
    }
    
}

struct ImageView: View {
    @Environment(\.presentationMode) var presentaionMode
    let model: DetailModel
    var body: some View {
        VStack {
            Image(model.image)
                .resizable()
                .cornerRadius(21)
                .frame(width: 358, height: 324)
                .overlay(
                    VStack{
                        Spacer()
                        Rectangle()
                            .frame(width:358, height:100)
                            .blur(radius: 90)
                    }
                        .cornerRadius(21)
                        .clipped()
                )
                .overlay(
                    VStack(alignment:.leading){
                        HStack{
                            Circle()
                                .frame(width:36, height:36)
                                .foregroundColor(Color.black.opacity(0.25))
                                .overlay(Image(systemName: "chevron.left"))
                                .onTapGesture {
                                    presentaionMode.wrappedValue.dismiss()
                                }
                            Spacer()
                            Circle()
                                .frame(width:36, height:36)
                                .foregroundColor(Color.black.opacity(0.25))
                                .overlay(Image(systemName: "bookmark"))
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                        Text(model.name)
                            .font(.setRalewayFont(size: 17, weight: .medium))
                            .foregroundColor(.white)
                        
                        Text(model.location)
                            .font(.setRalewayFont(size: 12, weight: .regular))
                            .foregroundColor(.white)
                        HStack{
                            HStack{
                                Image("ic-bed")
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 29, height: 29)
                                            .foregroundColor(.grayD4.opacity(0.20))
                                    )
                                
                                Text("\(model.bedRooms) Bedroom")
                                    .font(.setRalewayFont(size: 12, weight: .regular))
                                    .foregroundColor(.grayD4)
                            }
                            HStack{
                                Image("ic-bath")
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 29, height: 29)
                                            .foregroundColor(.grayD4.opacity(0.20))
                                    )
                                Text("\(model.bathRooms) Bedroom")
                                    .font(.setRalewayFont(size: 12, weight: .regular))
                                    .foregroundColor(.grayD4)
                                
                            }
                        }
                    }
                        .padding()
                )
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
