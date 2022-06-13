import React,{Fragment,useState} from 'react'
import * as userServices from '../services/userServices';
import { useNavigate  } from "react-router-dom";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import Nav from "../component/Navbar";
import back from "../photo-react/Background-For-Login.png"


const userService = userServices.default
toast.configure();
function Login() {
  const [email,setEmail]=useState("");
  const [password,setPassword] = useState("");
  const history = useNavigate ();

function userLogin() {
  if (email === "") {
     
    toast.error("Enter your email", {
      position: toast.POSITION.TOP_LEFT,
      autoClose: 2000,
      hideProgressBar: false,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
    });
  }
else if(password === ""){
  toast.error("Enter your password", {
    position: toast.POSITION.TOP_LEFT,
    autoClose: 2000,
    hideProgressBar: true,
    closeOnClick: true,
    pauseOnHover: true,
    draggable: true,
    progress: undefined,
  });
}

else{
  userService.onLogin(email,password)
  .then((res)=>{
  if(res){
  if(res.data.status === true){
    localStorage.setItem("token",res.data.data.token)
    localStorage.setItem("LoggedIn","true")
    history("/Home");
    history(0)
  }
  }
  }).catch((err)=>{
    toast.error("your email or password is incorrect", {
      position: toast.POSITION.TOP_LEFT,
      autoClose: 2000,
      hideProgressBar: true,
      closeOnClick: true,
      pauseOnHover: true,
      draggable: true,
      progress: undefined,
    });  
  })
}
}
  return (
    <Fragment>
    <Nav/>
    <div className='login-form' >
      <div className='login-img'>
      <img src={back} alt="background" width="1473"/>
      </div>

    <div className='log-ALL'>
        <h2><span>LOG</span>IN</h2>
        <input 
        type="email"
        className="box-log" 
        placeholder="Enter Your Email"
        onChange={(e)=>setEmail(e.target.value)} />

        <input type="password" 
        className="box-log" 
        placeholder="Enter Your password"  
        onChange={(e)=>setPassword(e.target.value)} />

        <a href="/ForgetPassword">Forget Password?</a><br/>

        <button className="btn" id="Submit" onClick={()=>userLogin()}>
        login
        </button>
        <div className='check'>
        <input type="checkbox" id="remember"/>
        <label for="remember">remember me</label>
        </div>
        <h3>or</h3>
        <div className='SignUpL'>
          <h4>Here for the first time?</h4>
          <div className="SignLink">
            <a href="/Sign">Create an account</a>
          </div>
      
        </div>
      
  </div>
</div>
</Fragment>
)}

export default Login
