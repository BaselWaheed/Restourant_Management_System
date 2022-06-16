import React,{Fragment, useState} from 'react'
import * as userServices from '../services/userServices';
import { useNavigate  } from "react-router-dom";
import "react-toastify/dist/ReactToastify.css";
import { toast } from "react-toastify";
import Nav from "./Navbar"


const userService = userServices.default
const WriteReview = () => {
    const[comment,setComment]=useState("");

    toast.configure();
    const history = useNavigate();

    function userReview() {
        if(comment==="" ){
            toast.error("Enter your review", {
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
            userService.onReview(comment)
                .then((res)=>{
            if(res){
                if(res.data.status === true){
                    history("/Home");
                    toast.success('thanks for your review', {
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
    
    return(
        <Fragment>
        <Nav/>
        <div className='write-review'>
            <div className='write-review-contian'>
            <h1> Your <span>Review</span></h1>
                <div className='write-review-text'>
                    <input type='text' className='write-review-input' placeholder='your review'onChange={(e)=>setComment(e.target.value)}
                    />
                    <br/>
                    <bottom className='btn' onClick={()=>userReview()}>submit</bottom>
                    
                </div>

            </div>
        </div>
    </Fragment>
    )
}

export default WriteReview;