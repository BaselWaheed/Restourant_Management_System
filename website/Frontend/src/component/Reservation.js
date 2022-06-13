import React,{Fragment, useState} from 'react'
import * as userServices from '../services/userServices';
import { useNavigate  } from "react-router-dom";
import "react-toastify/dist/ReactToastify.css";
import { toast } from "react-toastify";
import Nav from "./Navbar"
import resimg from"../photo-react/back.png"


const userService = userServices.default
const Reservation =() => {

    const [reservguesttcount,setreservguestcount]=useState("");
    const [reservDate,setreservDate]=useState("");
    const [reservtime,setreservtime]=useState("");
    const history = useNavigate ();

    toast.configure();

    function userReservation() {
        if(reservguesttcount==="" ){
            toast.error("Enter people count", {
              position: toast.POSITION.TOP_LEFT,
              autoClose: 4000,
              hideProgressBar: false,
              closeOnClick: true,
              pauseOnHover: true,
              draggable: true,
              progress: undefined,
            });
        }else if(reservDate===""){
            toast.error("Enter reservation date", {
              position: toast.POSITION.TOP_LEFT,
              autoClose: 4000,
              hideProgressBar: false,
              closeOnClick: true,
              pauseOnHover: true,
              draggable: true,
              progress: undefined,
            });
        }else if (new Date(new Date().toDateString()) > new Date(reservDate) ){
            toast.error("Enter valid reservation date", {
                position: toast.POSITION.TOP_LEFT,
                autoClose: 4000,
                hideProgressBar: false,
                closeOnClick: true,
                pauseOnHover: true,
                draggable: true,
                progress: undefined,
              });
        }else if(reservtime===""){
            toast.error("Enter reservation time", {
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
            userService.onReservation(reservDate,reservguesttcount,reservtime)
                .then((res)=>{
            if(res){
                if(res.data.status === true){
                    history("/Home");
                    toast.success("confermed reservation", {
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
                toast.error("something is wrong", {
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

    return(
        <Fragment>
        <Nav/>
            <div className="reserv-container" >
            <div class="image">
            <img src={resimg} alt="resimg"/>
            </div>
                <div className="reservation" >
                    <input className="people" 
                    type="number" name="quantity" 
                    min="1" max="150" 
                    placeholder="Number of people (1-150)" 
                    onChange={(e)=>setreservguestcount(e.target.value)}/>
                    <br />
                    <input className="clender" 
                    type="date" 
                    name="birthdaytime" 
                    onChange={(e)=>setreservDate(e.target.value)}/>
                    <br/>
                    <input className="time" 
                    type="time" 
                    name="birthdaytime" 
                    onChange={(e)=>setreservtime(e.target.value)}/>
                    <br/>
                    <button className="btn" type="submit"  onClick={()=>userReservation()}>confirm</button><button/>
                </div>
            </div>
            
        </Fragment>
    )
}
export default Reservation