import React , {useState,useEffect} from "react"
import { FaShoppingCart ,FaHeart , FaBars } from "react-icons/fa";
import { BsPersonCircle } from "react-icons/bs";
import { useLocation } from "react-router-dom"
import Logo from '../Icons/logo.png'

const Navbar = ({dishName,search,setDishName}) => {
  const [looged]=useState(localStorage.getItem('LoggedIn'))
  const location = useLocation();
  useEffect(()=>{
    
  },[looged])
 
    return(
        <div className='nav'>
        <nav>
            <div className='logo'> 
                <img src={Logo} width="42" alt="logo"/><div className="lo"><span>K</span>ale <span>M</span>e <span>C</span>razy </div>
            </div>
            <div className='navbar-contain'>
                <ul>
                    <li><a href="/Home">Home</a></li>
                    <li><a href="/Menu">Menu</a></li>
                    <li><a href="/About">About Us</a></li>

                   {location.pathname === "/Login" || looged === 'false'?
                   null
                   :
                   <li><a href="/Reservation">Reservation</a></li>} 
                    <li><a href="/Review">Review</a></li>
                    <li>
              {/*
                    <input 
                    type="search" 
                    className="search" 
                    placeholder="search"
                    onChange={(e)=>setDishName(e.target.value)} />

                    <button
                    onClick={()=>search()}
                    className="btnSearch">
                    search
                    </button> 
              */}
                    </li>

                </ul>
            </div>
            <div className='icon-contain'>
                {
                  looged === 'true' ?
                  null:
                  <a href="/Login"><div className="icons"><BsPersonCircle/></div></a>
                }
                {location.pathname === "/Login" || looged === 'false'?
                null                   
                :
                <a href="/FAV"><div className="icons"><FaHeart/></div></a>
                }
                {location.pathname === "/Login" || looged === 'false'?
                null                   
                :
                <a href="/Cart"><div className="icons"><FaShoppingCart/></div></a>
                }

                {location.pathname === "/Login" || looged === 'false'?
              null                   
                :
                <a href="/Setting"><div className="icons"><FaBars/></div></a>
            }              
            </div>
      </nav>
    </div>
    )
}
export default Navbar;