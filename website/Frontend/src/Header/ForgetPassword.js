import React from 'react';
import { BsChevronLeft } from "react-icons/bs";
import * as userServices from '../services/userServices';
import { useState} from 'react';
import { useNavigate  } from "react-router-dom";
import Nav from "../component/Navbar"
import { toast } from "react-toastify";
import back from "../photo-react/Background-For-Login.png"


const userService = userServices.default
const ForgetPassword = () => {

  const [email,setemail] = useState("");
  const history = useNavigate ();
  toast.configure();

  function userForgerPassword() {
    if(email===""){
      toast.error("Enter your email", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 4000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
  }else{
    userService.onForgetPassword(email)
    .then((res)=>{
      if(res){
        if(res.data.status === true){
          toast.success("check your email", {
            position: toast.POSITION.TOP_LEFT,
            autoClose: 4000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
          });
        history("/login");
      }
    }
    }).catch((err)=>{
      toast.error("Enter your correct email", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 4000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });    })
  }
  }


  return (
    <fragment>
    <Nav/>
    <div className='forg-page'>
    <div className='login-img'>
      <img src={back} alt="background" width="1470"/>
    </div>
    <div className='Forget-pass'>
        <div className='reset'>
            <a className="fas-left" href="/LoginF">< BsChevronLeft/></a>
        <div className="forgetpass-form">
          <h3>Reset your password</h3>
          <p>We will send you an email to reset your password.</p>
          <div className='reset-form'>

            <label ><h5>Email:</h5></label>
            <input type="email" 
            placeholder="Enter Your Email" 
            className="box"
            onChange={(e)=>setemail(e.target.value)}/>

          </div>
          <div className='reset-btn'>
          <button className="btn" id="Submit" onClick={()=>userForgerPassword()}>Submit</button>
          <a href="/Login" className="btn" id="Cancel">Cancel</a>
          </div>

      </div>
      </div>

    </div></div>
    </fragment>
  )
}

export default ForgetPassword
