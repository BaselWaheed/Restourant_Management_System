import React, { Fragment } from "react";
import * as userServices from '../services/userServices';
import {useState} from 'react';
import { useNavigate  } from "react-router-dom";
import { toast } from "react-toastify";
import Nav from "./Navbar"

import Footer from "./Footer";


const userService = userServices.default
const ChangePass = () => {

  const [old_password,setoldPassword] =useState("");
  const [new_password,setnewPassword] =useState("");
  const [confermPassword,setconfermPassword] =useState("");
  const history = useNavigate ();

  toast.configure();

  function userChangePass() {
      
    if(old_password==="" ){
      toast.error("Enter your old password", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 40000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
    }else if(new_password===""){
      toast.error("Enter your new password", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 40000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
    }else if(confermPassword===""){
      toast.error("Enter your new password", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 40000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
    }
    else if(new_password !== confermPassword){
      toast.error("enter conferm password again", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 2000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
    }
    else{
      userService.onChangePass(old_password,new_password,confermPassword)
      .then((res)=>{
      if(res){
        if(res.data.status === true){
          toast.success("password changed", {
            position: toast.POSITION.TOP_LEFT,
            autoClose: 2000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
          });
          history("/Home");
        }
      }
      }).catch((err)=>{
        console.log("error",err)
      })
    }
  }
    return(
      <Fragment>
      <Nav/>
        <div className="change-pass">
            <div className="titel">
                <h1> Change <span>password</span></h1>
            </div>
            <div className="changepass-form" >
            <p className="p">Please enter (and confirm) your new password.</p>
            <br/><br/>
            <table className="container">
                <tbody>
                <tr>  
                    <td><label >old password</label></td>
                    <td><input 
                    type="password" 
                    placeholder=" old password" 
                    onChange={(e)=>setoldPassword(e.target.value)}/></td>
                </tr>
                <tr>  
                    <td><label >New Password</label></td>
                    <td><input type="password" placeholder="new password" onChange={(e)=>setnewPassword(e.target.value)}/></td>
                </tr>
                
                <tr> 
                    <td><label >Confirm Password</label></td>
                    <td><input type="password" placeholder="Confirm password"onChange={(e)=>setconfermPassword(e.target.value)}/></td>
                </tr>

                <button className="btn" id="Submit" onClick={()=>userChangePass()}> Change Password</button>                
            </tbody></table>
        </div>
        </div>
        <Footer/>
        </Fragment>
    )
}

export default ChangePass;