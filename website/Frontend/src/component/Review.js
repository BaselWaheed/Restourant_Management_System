import React,{Fragment,useState,useEffect} from "react"
import Nav from "./Navbar"
import * as userServices from '../services/userServices';
import qout from "../photo-react/qout.jpg"
import rev1 from "../photo-react/rev1.jpg"
import rev2 from "../photo-react/rev2.jpg"

const userService = userServices.default
const Reviews =() => {
    const [dataReview,setDataReview]=useState([])
    useEffect(()=>{
        review();
    },[])
    function review(){
        userService.get_review().then((res)=>{
            setDataReview(res.data.data.info)
            
        })
    }
    return(
        <Fragment>
        <Nav/>
        <div className="review">
            <h1 className="heading">Customer's <span>REVIEW</span></h1>
            {dataReview.map((info)=>{
                return(
                    <div className='box-container1'>
                        <div className="box">
                            <img src={qout} alt="review"/> 
                            <p>"{info.comment}"</p>
                            {info.is_male === true ? <img src={rev1} className="under" alt="review"/>
                            : 
                            <img src={rev2} className="under" alt="review"/>}
                             
                            <h3 className="under">
                            {info.user}
                            </h3>
                        </div>
                    </div>
                )
            })}
        </div>
        </Fragment>
    )
}
export default Reviews