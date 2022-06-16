import React ,{Component} from 'react';
import { BrowserRouter , Route, Routes } from 'react-router-dom';
import Home from './component/Home'
import About from './component/AboutUs'
import Reservation from './component/Reservation'
import Review from './component/Review'
import WriteReview from './component/WriteReview'
import Setting from './component/Setting'
import Menu from "./component/Menu"
import AccountInfo from './component/AccountInfo'
import MyOrders from './component/MyOrders'
import ChangePass from './component/ChangePass'
import UpdateProfile from './component/UpdateProfile'
import FAV from "./Header/FAV";
import Cart from "./Header/Cart";
import CheakOut from './Header/CheakOut';
import Login from "./Header/Login"
import Sign from './Header/Sign';
import ForgetPassword from"./Header/ForgetPassword"
import Auth from './authLoading'



class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div className="App">
        <Routes>

           <Route path="/" element={<Auth />} />
            <Route path="/Home" element={<Home />} />
            <Route path="/Login" element={<Login />} />
            <Route path="/Sign" element={<Sign/>} />
            <Route path="/LoginF" element={<Login />} />
            <Route path="/ForgetPassword" element={<ForgetPassword/>} />
            <Route path="/Menu" element={<Menu/>} />
            <Route path="/About" element={<About />} />
            <Route path="/Reservation" element={<Reservation />} />
            <Route path="/Review" element={<Review />} />
            <Route path="/WriteReview" element={<WriteReview />} />
            <Route path="/Setting" element={<Setting />} />
            <Route path="/AccountInfo" element={<AccountInfo />} />
            <Route path="/updateProfile" element={<UpdateProfile />} />
            <Route path="/MyOrders" element={<MyOrders />} />
            <Route path="/ChangePass" element={<ChangePass />} />
            <Route path="/FAV" element={<FAV/>} />
            <Route path="/Cart" element={<Cart/>} />\
            <Route path="/CheakOut" element={<CheakOut/>} />

          </Routes>
        </div>
      </BrowserRouter>
    );
  }
}

export default App;
