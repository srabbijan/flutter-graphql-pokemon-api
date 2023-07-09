# safewheel
base url: https://graphql-pokemon2.vercel.app
List Page 
 query {
  pokemons(first:20) {
    id
    name
    weight {
      minimum
      maximum
    }
    height {
      minimum
      maximum
    }
    classification
    image
  } 
}
![image](https://github.com/srabbijan/flutter-graphql-pokemon-api/assets/32338236/8bcf089d-431b-486a-a0fb-168e353eb536)
Details page 
query {
  pokemon(id:"UG9rZW1vbjowMDE=",name:"Bulbasaur"){
    id
    name
    weight {
      minimum
      maximum
    }
    height {
      minimum
      maximum
    }
    classification
    image
  }
}
![image](https://github.com/srabbijan/flutter-graphql-pokemon-api/assets/32338236/48b8928d-2bf9-40fa-88f2-761a588e18be)


