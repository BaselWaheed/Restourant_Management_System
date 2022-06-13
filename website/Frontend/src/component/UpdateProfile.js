import React,{Fragment ,useEffect, useState} from 'react'
import { useLocation } from "react-router-dom";
import Nav from "./Navbar"
import Footer from "./Footer";
import { toast } from "react-toastify";
import { useNavigate  } from "react-router-dom";



import * as userServices from '../services/userServices';
const userService = userServices.default

    const UpdateProfile =()=>{
      
        const location = useLocation();
         const[email,setEmail] = useState("")
         const [first_name,setfirst_name] = useState("")
         const [last_name,setlast_name] = useState("")
         const [username,setusername] = useState("")
         const [birthdate,setbirthdate] = useState("")


         const history = useNavigate ();
  toast.configure();

        useEffect(()=>{
            console.log("data", location.state);
            setEmail(location.state.userEmail)
            setfirst_name(location.state.userFirstName)
            setlast_name(location.state.userLastName)
            setusername(location.state.userUsername)
            setbirthdate(location.state.userDateOfBirth)

          },[location.state]);
    

    

         function change_profile(){
             userService.userProfileUpdate(email,first_name,last_name,username,birthdate).then((res)=>{
                if(res.data.status === true){
                    history("/AccountInfo");
                    toast.success("update success", {
                      position: toast.POSITION.TOP_LEFT,
                      autoClose: 4000,
                      hideProgressBar: false,
                      closeOnClick: true,
                      pauseOnHover: true,
                      draggable: true,
                      progress: undefined,
                    });
                    
            }
            
                  
            }).catch((err)=>{
                toast.error("something is wrong  try agian later", {
                    position: toast.POSITION.TOP_LEFT,
                    autoClose: 4000,
                    hideProgressBar: false,
                    closeOnClick: true,
                    pauseOnHover: true,
                    draggable: true,
                    progress: undefined,
                  });
            })
            
         }

    return (
        <Fragment>
        <Nav/>
        <div className="update-profile">
            <div className="titel">
                <h1> Update <span>Profile</span></h1>
            </div>
            <div className="update-profile-contant">
                <ul>
                <label>Email: </label>
                    <input 
                    type="email" 
                    value={email}
                    /*  onChange={(e)=>setEmail(e.target.value)} */
                    disable
                    /><br/>

                    <label>First Name: </label>
                    <input 
                    type="text" 
                    value={first_name}
                    onChange={(e)=>setfirst_name(e.target.value)}
                    /><br/>

                    <label>last Name: </label>
                    <input 
                    type="text" 
                    value={last_name}
                     onChange={(e)=>setlast_name(e.target.value)}
                    /><br/>

                    <label>User Name: </label>
                    <input 
                    type="text" 
                    value={username}
                     onChange={(e)=>setusername(e.target.value)}

                    /> <br/>

                    <label> Date Of Birth:  </label>
                    <input type="date" 
                    value={birthdate}
                     onChange={(e)=>setbirthdate(e.target.value)}

                    />
                </ul>
                <button className="btn"
                 type="submit" 
                 onClick={()=>change_profile()}
                >Update</button>

            </div>
        </div>
        <Footer/>
        </Fragment>
    )

}
export default UpdateProfile;