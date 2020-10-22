//
//  ContentView.swift
//  SwiftUIGroceriesApp
//
//  Created by Richard Price on 21/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State var selected = "Home"
    var body: some View {
        VStack {
            if self.selected == "Home" {
                Home()
            } else if self.selected == "Wishlist" {
                GeometryReader {_ in
                    Text("Wishlist")
                }
            } else {
                GeometryReader {_ in
                    Text("Cart")
                }
            }
            CustomTabView(selected: $selected)
        }
    }
}

struct HomeBottomView: View {
    var body: some View {

        VStack {
                HStack {
                    Text("Fresh New Items")
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("More")
                    }.foregroundColor(Color("Color"))
                }.padding(.vertical, 15)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 15) {
                    ForEach(freshitems) { i in
                        FreshCellView(data: i)
                    }
                }
            })
        }
    }
}

struct FreshCellView: View {
    var data : fresh
    var body: some View {
        VStack(spacing: 10) {
            Image(data.image)
            Text(data.name).fontWeight(.semibold)
            Text(data.price).foregroundColor(.green).fontWeight(.semibold)
        }
    }
}

struct Home: View {
    @State var txt = ""
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 12) {
                Image("Home").renderingMode(.original).resizable().frame(width:30, height: 30)
                Text("Hey, Richy").font(.body)
                Spacer()
                Button(action: {
                    
                }) {
                    Image("filter").renderingMode(.original)
                }
            }
            
            HStack(spacing: 15) {
                HStack {
                    Image(systemName: "magnifyingglass").font(.body)
                    TextField("Search Groceries", text: $txt)
                }.padding(10)
                .background(Color("Color1"))
                .cornerRadius(15)
                
                Button(action: {
                    
                }) {
                    Image("mic").renderingMode(.original)
                }
            }
            //MIDDLE TOP SECTION
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                VStack {
                    Image("top").resizable().overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Text("GET 20% OFF").font(.title).foregroundColor(.white)
                                Spacer()
                            }.padding()
                        }
                    )
                    //MIDDLE SECTION
                    HStack {
                        Text("Catergories")
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Text("More")
                        }.foregroundColor(Color("Color"))
                    }.padding(.vertical, 15)
                    //MIDDLE SECTION SCROLLVIEW
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 30) {
                            ForEach(categories, id: \.self) { i in
                                VStack {
                                    Image(i).renderingMode(.original)
                                    Text(i).fontWeight(.semibold).font(.system(size: 12))
                                }.padding(.horizontal, 1)
                            }
                        }
                    })
                    
                    //MIDDLE BOTTOM SECTION
                    HomeBottomView()
                }
            })
            
            Spacer()
            
        }.padding(.horizontal)
    }
}

struct CustomTabView : View {
    @Binding var selected : String
    var body : some View{
        HStack{
            ForEach(tabs,id: \.self){i in
                VStack(spacing: 20){
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(
                            Capsule().fill(self.selected == i ? Color("Color") : Color.clear).frame(width: 55, height: 5)
                        )
                    Button(action: {
                        self.selected = i
                    }) {
                        VStack{
                            Image(i).renderingMode(.original)
                            Text(i).foregroundColor(.black)
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
}

// sample datas...
var tabs = ["Home","Wishlist","Cart"]
var categories = ["Fruits","Vegetables","Beverages","Fish","Breads"]

struct fresh : Identifiable {
    var id : Int
    var name : String
    var price : String
    var image : String
}

struct recipe : Identifiable {
    var id : Int
    var name : String
    var author : String
    var image : String
    var authorpic : String
}

var freshitems = [
    fresh(id: 0, name: "Frozen Fish", price: "20.00 / pcs",image: "f1"),
    fresh(id: 1, name: "Seedless Lemon", price: "30.00 / kg",image: "f2"),
    fresh(id: 2, name: "Coffee Bread", price: "15.00 / pack",image: "f3")
]

var recipeitems = [
    recipe(id: 0, name: "Basil Pasta", author: "Karlien Nijhuis",image: "r1",authorpic: "rp1"),
    recipe(id: 1, name: "Banana Rice", author: "Harmen Porter",image: "r2",authorpic: "rp2"),
    recipe(id: 2, name: "Ramen", author: "Marama Peter",image: "r3",authorpic: "rp3")
]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
