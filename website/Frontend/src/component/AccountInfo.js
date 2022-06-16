import React,{Fragment,useState,useEffect} from "react"
import * as userServices from '../services/userServices';
import Nav from "./Navbar"
import Footer from "./Footer";
import { Link } from "react-router-dom";
const userService = userServices.default

const AccountInfo = () => {

const [userEmail,setUserEmail]=useState("")
const [userFirstName,setUserFirstName]=useState("")
const [userLastName,setUserLastName]=useState("")
const [userUsername,setUserUsername]=useState("")
const [userDateOfBirth,setuserDateOfBirth]=useState("")
const [,setuserIsMale]=useState("")
const [userPhone,setUserName]=useState("")
const [userAddress,setuserAddress]=useState("")


useEffect(()=>{
    profile();
},[])

function profile(){
    userService.userProfile().then((res)=>{
            setUserEmail(res.data.data.email);
            setUserFirstName(res.data.data.first_name)
            setUserLastName(res.data.data.last_name)
            setUserUsername(res.data.data.username)
            setuserDateOfBirth(res.data.data.birthdate)
            setuserIsMale(res.data.data.isMale)
            setUserName(res.data.data.phone)
            setuserAddress(res.data.data.address)

    })
}


    return(
        <Fragment>
        <Nav/>
        <div className="account-info">
            <div className="titel">
                <h2>  <span>ACCOUNT</span>INFO</h2>
            </div>
            <div className="account-info-contain">
                <ul>
                    <p> Email:&nbsp; &nbsp; {userEmail} </p> 
                    <p> First Name:&nbsp; &nbsp; {userFirstName}</p>
                    <p> Last Name:&nbsp; &nbsp; {userLastName} </p>
                    <p>User Name:&nbsp; &nbsp;{userUsername}</p>
                    <p>Date Of Birth:&nbsp; &nbsp; {userDateOfBirth} </p>
                    <p>Phon Number:&nbsp; &nbsp; {userPhone} </p>
                    <p>Address:&nbsp; &nbsp; {userAddress} </p>
                </ul>
                <Link className="btn"
                 to={'/updateprofile'}
                 state={{ 
                     userEmail: userEmail,
                     userFirstName:userFirstName,
                     userLastName:userLastName,
                     userUsername:userUsername,
                     userDateOfBirth:userDateOfBirth,
                     
                 }} >updateProfile</Link>
            </div>
        </div>
        <Footer/>

        </Fragment>
    )
}

export default AccountInfo