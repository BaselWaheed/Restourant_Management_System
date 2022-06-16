import React,{Fragment, useState} from 'react'
import * as userServices from '../services/userServices';
import { useNavigate  } from "react-router-dom";
import {FaTimes } from "react-icons/fa";
import Nav from "../component/Navbar"
import { toast } from "react-toastify";
import back from "../photo-react/Background-For-Login.png"

const userService = userServices.default
const Sign = () => {
    const [firstname,setfirstname]=useState("");
    const [lastname,setlastname]=useState("");
    const [username,setusername]=useState("");
    const [email,setemail]=useState("");
    const [password,setPassword] = useState("");
    const [birthdate,setbirthdate]=useState("");
    const [isMale,setisMale] = useState(false);
    const [address,setaddress] = useState("");
    const [phone,setphone] = useState("");
    const[ConfirmPassword,setConfirmPassword]=useState("");
    const history = useNavigate ();

    toast.configure();
  async  function userSignup(e) {

    if(firstname===""){
      toast.error("Enter people count", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 4000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
  }
  else if(password!==ConfirmPassword){
    e.preventDefault();
    toast.error("password not match", {
      position: toast.POSITION.TOP_LEFT,
      autoClose: 4000,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
    });
  }
  else if (new Date(new Date().toDateString()) < new Date(birthdate) ){
    e.preventDefault();
    toast.error("Enter valid birthdate", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 4000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
  }
  else{
      e.preventDefault();
      await  userService.onSignUp(firstname,lastname,username,email,password,birthdate,isMale,address,phone)
        .then((res)=>{
      if(res){
        if(res.data.status === true){
          history("/Login");
          toast.success('check your email', {
            position: "top-left",
            autoClose: 4000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
          });
        }
      }
        }).catch((err)=>{
          console.log("error",err)
        })
      }
  
}
      const handleSelect = (e) => {
        /* setisMale(e) */
        console.log("e", e.target.value)
        if(e.target.value === "male"){
            setisMale(true)
        }
        else if(e.target.value === "female"){
            setisMale(false)
        }
    }


  return (
    <Fragment>
    <Nav/>
    <div className='si-form'>
    <div className='login-img'>
      <img src={back} alt="background" width="1489"/>
    </div>
     <div className="signup-form">
         <a className="fas fa-times" id="close-S" href="/LoginF"><FaTimes/></a> 
         <form >
        <h3><span>SIGN</span>UP</h3>
        <div className="allform">
            <div className="name">
                <label >First Name</label>
                <input type="text" 
                placeholder="Enter Your First 
                Name" className="box"  
                onChange={(e)=>setfirstname(e.target.value)}/>
            </div>
            <div className="name">
                <label >Last Name</label>
                <input type="text"  
                placeholder="Enter Your Last Name" 
                className="box"  
                onChange={(e)=>setlastname(e.target.value)}/>
            </div>
            <div className="name">
                <label >Email</label>
                <input type="email"  
                placeholder="Enter Your Email" 
                className="box"  
                onChange={(e)=>setemail(e.target.value)}/>
            </div>
            <div className="name">
                <label >User Name</label>
                <input type="text"  
                placeholder="Enter Your user name" 
                className="box"  
                onChange={(e)=>setusername(e.target.value)}/>
            </div>
            <div className="name">
                <label >Password</label>
                <input type="password" 
                placeholder="Enter Your password" 
                className="box"  
                onChange={(e)=>setPassword(e.target.value)}/>
            </div>
            <div className="name">
                <label >Confirm Password</label>
                <input type="password" 
                placeholder="Enter Your password" 
                className="box"  
                onChange={(e)=>setConfirmPassword(e.target.value)}/>
            </div>
            <div className="name">
                <label > Address</label>
                <input type="text" 
                placeholder="Enter Your address" 
                className="box" 
                onChange={(e)=>setaddress(e.target.value)}/>
            </div>
            <div className="name">
                <label >Phone Number</label>
                <input type="text" 
                placeholder="Enter Your phone number" 
                className="box" 
                onChange={(e)=>setphone(e.target.value)}/>
            </div>

            <div className="name">
              <label >birthdata</label>
              <input type="date"  
              placeholder="Enter Your birthdata" 
              className="box" 
              onChange={(e)=>setbirthdate(e.target.value)}/>
            </div>

            <div className="gender">
              <input type="radio" name="gender" value="male"  
              onClick={(e)=>handleSelect(e)}/> male &nbsp;

              <input type="radio" name="gender" value="female" 
              onClick={(e)=>handleSelect(e)}/> female
            </div>
           
            <button type="submit" className="btn" onClick={(e)=>userSignup(e)}>Sign Up </button>
        </div>
    </form>
</div></div>
</Fragment>
  )
}

export default Sign
