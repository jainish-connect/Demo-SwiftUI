//
//  ContentView.swift
//  Demo SwiftUI
//
//  Created by Jainish Patel on 9/23/19.
//  Copyright © 2019 Jainish Patel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let arrPokemon = PokemonModel.pokemonModel
    
    var body: some View {
        NavigationView{
            List{
                ScrollView(.horizontal, showsIndicators: false){
                    VStack(alignment : .leading){
                        Text("Top 10 Pokemon")
                            .font(.title)
                        HStack{
                            ForEach(arrPokemon){ pokemon in
                                PokemonView(pokemon: pokemon)
                            }.frame(height: 200)
                        }
                    }
                }
                
                VStack{
                    ForEach(arrPokemon){ pokemon in
                        PokemonListView(pokemon: pokemon)
                    }
                }
                
            }.navigationBarTitle(Text("Pokemon Lists"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PokemonModel: Identifiable{
    var id: Int
    
    let name, imgName: String
    
    static let pokemonModel: [PokemonModel] = [
        .init(id: 0, name: "Pokemon 1", imgName: "p1"),
        .init(id: 1, name: "Pokemon 2", imgName: "p2"),
        .init(id: 2, name: "Pokemon 3", imgName: "p3"),
        .init(id: 3, name: "Pokemon 4", imgName: "p4"),
        .init(id: 4, name: "Pokemon 5", imgName: "p5"),
        .init(id: 5, name: "Pokemon 6", imgName: "p6"),
        .init(id: 6, name: "Pokemon 7", imgName: "p7"),
        .init(id: 7, name: "Pokemon 8", imgName: "p8"),
        .init(id: 8, name: "Pokemon 9", imgName: "p9"),
        .init(id: 9, name: "Pokemon 10", imgName: "p10")
    ]
}

struct PokemonView: View{
    
    let pokemon: PokemonModel
    
    var body: some View{
        VStack(alignment: .center){
            Image(pokemon.imgName)
                .resizable()
                .cornerRadius(5).clipped()
                .frame(width: 150, height: 150, alignment: .leading)
            Text(pokemon.name)
        }
    }
    
}

struct PokemonListView: View{
    
    let pokemon: PokemonModel
    
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                Image(pokemon.imgName)
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .leading)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black))
                    .overlay(Circle().stroke(lineWidth: 4))
                VStack(alignment: .leading){
                    Text(pokemon.name)
                        .font(.headline)
                    Text("Good At Attack")
                        .font(.subheadline)
                }.padding(8)
            }.padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0))
            Text("The user attacks everything around it by causing a tremendous explosion. The user faints upon using this move.").frame(height: 50).lineLimit(nil).padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
            Image(pokemon.imgName)
                .resizable()
                .frame(height: 350)
                .clipped()
                .padding(12)
        }.padding(EdgeInsets(top: 0, leading: -20, bottom: -8, trailing: -20))
    }
}

