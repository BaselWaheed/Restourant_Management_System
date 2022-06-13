import React,{Fragment,useState,useEffect} from "react"
import Nav from "./Navbar"
import * as userServices from '../services/userServices';

const userService = userServices.default
const MyOrders = () => {
    const [dateOrder,setDateOrder]=useState([])


    useEffect(()=>{
        order();
    },[])

    function order(){
        userService.myOrder().then((res)=>{
            setDateOrder(res.data.data.My_order)
            
        })
    }

    return(
        <Fragment>
        <Nav/>
        <div className="my-orders">
            <div className="titel">
                <h1> MY <span>ORDERS </span></h1>
            </div>
        {dateOrder.map((My_order)=>{
                return(
                    <div className="my-orders-contain">
                    <ul>
                        <p>
                            <a className="datee" href="/" >{My_order.order_date}</a>
                            <a href="/WriteReview" className="btn">review</a> 
                        </p>
                    </ul>
                </div>
                )
            })}

        </div>
        </Fragment>
    )
}
export default MyOrders;