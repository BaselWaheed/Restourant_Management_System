import React,{Fragment,useState} from 'react'
import * as userServices from '../services/userServices';
import { useNavigate  } from "react-router-dom";
import { toast } from "react-toastify";
import Navbar from '../component/Navbar'
import background from "../photo-react/Background-For-Login.png";

const userService = userServices.default
const CheakOut = () => {
  
  const [address,setaddress]=useState("");
  const [phone,setphone]=useState("");

  const history = useNavigate ();
  toast.configure();

  function userCheckOut() {
    if(address==="" ){
        toast.error("Enter your address", {
          position: toast.POSITION.TOP_LEFT,
          autoClose: 4000,
          hideProgressBar: false,
          closeOnClick: true,
          pauseOnHover: true,
          draggable: true,
          progress: undefined,
        });
        
    }else if(phone===""){
        toast.error("Enter your phone", {
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
        userService.check_out(phone,address)
          .then((res)=>{
        if(res){
            if(res.data.status === true){
                history("/MyOrders");
                toast.success("order success", {
                  position: toast.POSITION.TOP_LEFT,
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
            toast.error("something is wrong try agian later", {
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
  }

  return (
    <Fragment>
    <Navbar/>
    <div className="Forget-pass">
    <div class="image">
            <img src={background} alt="cheak-out"/>
    </div>
    <div className="resets">
    <div className="forgetpass-form2">
    <h2> Confirm Check Out</h2>
        <div className='reset-form'>
                <label ><h5>Address:</h5></label>
                <input type="text" 
                placeholder="Enter Your Address" 
                className="box"
                onChange={(e)=>setaddress(e.target.value)}/>
        </div>
        <div className='reset-form'>
                <label ><h5>Phone:</h5></label>
                <input type="phone" 
                placeholder="Enter Your Phone" 
                className="box"
                onChange={(e)=>setphone(e.target.value)}/>
        </div>
        <div className='reset-btn'>
          <button className="btn" id="Submit" onClick={()=>userCheckOut()}>Save</button>
          <a href="/Cart" className="btn" id="Cancel">Cancel</a> 
        </div>
    </div>
    </div>
    </div>

    </Fragment>
  )
}

export default CheakOut
