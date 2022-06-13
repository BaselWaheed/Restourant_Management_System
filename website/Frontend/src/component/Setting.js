import React,{Fragment} from "react"
import { useNavigate  } from "react-router-dom";
import Nav from "./Navbar"
import Footer from "./Footer";


const Setting = () => {

    const history = useNavigate ();

    function handleLogout(){
        localStorage.removeItem("token");
        history("/Login");
        console.log("pressed")
        localStorage.setItem("LoggedIn","false")
    }
    return(
        <Fragment>
        <Nav/>
        <div className='setting'>
            
            <div className='titel'> 
                <h1>SETTI<span>NGS</span></h1>
            </div>
            <div className='setting-contain'>
                <ul>
                    <p><a href="/AccountInfo">Accout Info<span>></span> </a></p>
                    <p><a href="/MyOrders">My Orders <span>></span> </a></p>
                    <p><a href="/ChangePass">Change Password <span>></span></a></p>
                    <p><button className="btn" onClick={()=>handleLogout()}>logOut</button><span></span></p>
                </ul>
            </div>
            <Footer/>
        </div>
        </Fragment>
    )
}
export default Setting;