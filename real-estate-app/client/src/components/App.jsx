import React from "react";
import ReactDOM from "react-dom";
// import Signup from
// import { useHistory } from "react-router-dom";
  <h1 id="app">Yes! Chloe</h1>
function App(){

return (
  <h1 id="app">Yes! Chloe</h1>
)

// const history = useHistory()

//
// return (
// <>
// <NavBar user={user} setUser={setUser} setItemToEdit={setItemToEdit} />
// <main>
//   <Switch>
//     <Route path="/itemform">
//       <MollyItemForm 
//         item={itemToEdit} 
//         setItemToEdit={setItemToEdit}
//         setErrors={setErrors} 
//         errors={errors} 
//         causes={causes} 
//         user={user}
//         onDeleteItem={onDeleteItem} 
//         onSubmitItem={onSubmitItem}
//         /> 
//     </Route>
//     <Route path="/items/:id" >
//       <ItemPage />
//     </Route>
//     {/* <Route path="/sellerpage/edititem" >
//       <MollyItemForm item={itemToDisplay} causes={causes}/>
//     </Route> */}
//     <Route exact path="/">
//       <Home 
//         itemsToDisplay={itemsToDisplay} 
//         onCategoryChange={onCategoryChange} 
//         selectedCategory={selectedCategory} 
//         selectedGender={selectedGender} 
//         onGenderChange={onGenderChange}
//         setSelectedCauses={setSelectedCauses}
//         causes={causes}
//       /> 
//     </Route>
//     <Route exact path="/login">
//       <Login onLogin={setUser} />
//     </Route>
//     <Route exact path="/sellerpage">
//       <SellerPage 
//         sellerItems={sellerItems} 
//         onCategoryChange={onCategoryChange} 
//         selectedCategory={selectedCategory} 
//         selectedGender={selectedGender} 
//         onGenderChange={onGenderChange}
//         setSelectedCauses={setSelectedCauses} 
//         setItemToEdit={setItemToEdit}
//         causes={causes}
//         />
//     </Route>
//   </Switch>
  
// </main>
// </>
// );
}

ReactDOM.render(<App/>, document.getElementById("app"))
// export default App;