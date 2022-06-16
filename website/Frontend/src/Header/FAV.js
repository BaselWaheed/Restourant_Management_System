import React,{Fragment ,useEffect, useState} from 'react'
import Nav from "../component/Navbar"
import Footer from '../component/Footer'
import { FcLike } from "react-icons/fc";
import { toast } from "react-toastify";

import * as userServices from '../services/userServices';





const userService = userServices.default

const FAV = () => {

  const [data,setData] = useState([])
  const [,setTotal] = useState("")
  useEffect(()=>{
    getData();
  },[])
  
  function getData(){
    userService.get_favorite().then((res)=>{
      setData(res.data.data.product);
      setTotal(res.data.data.total_price)
      console.log("res",res.data.data)
    })
  }

  //remove from favorite
  function add_favorite(id){
    userService.post_favorite(id).then((res)=>{
        console.log(res.data)
        toast.success("removed to favourite", {
            position: toast.POSITION.TOP_LEFT,
            autoClose: 4000,
            hideProgressBar: false,
            closeOnClick: true,
            pauseOnHover: true,
            draggable: true,
            progress: undefined,
          });
          getData();
    })
}

  function add_item(id){
    userService.post_cart(id).then((res)=>{
        console.log(res.data)
        toast.success("added to cart", {
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



  return (
    <Fragment>
    <Nav/>

{
  data.length === 0 ?
    
    <div className='fav-item1'>
        <h1 className="heading">Favourites <span>Items</span></h1>
        <div className='items1'>
          <p className='text-cart'>Your favourite is empty</p>
          <p className='text-cart'>You can add items</p>
          <a href="/Menu" className="btn" id="aboutr">check product</a>
        </div>
      </div>
  :
      <div className='fav-item'>
      <h1 className="heading">Favourites <span>Items</span></h1>
      <div className='item'>

       <div className='items-te'>
        <p>&nbsp; &nbsp; &nbsp; &nbsp;product</p>
        <p>Name</p>
        <p>Price</p>
        <p>Favourite</p>
      </div>

   {
     data.map((item)=>{
       return (
        <div className='items-te'>
        <div className='items-cart'>
        <img src={item.dish_image} alt="items-fav" width="200" height="150"/>
        </div>
        <div className='items-bt'>
        
            <h4>{item.dish_name}</h4>
          </div>
          <div className='items-bt'>
        <h4>{item.dish_price}</h4>
        </div>
        <div className='items-bts'>
        <button  className="add-nav" onClick={()=>add_favorite(item.id)}><FcLike /></button>
        <div className='add-btn'>
        <button className="add-navs" onClick={()=>add_item(item.id)}>Add To Cart</button>
        </div>
        </div>
      </div>
       )
     })
   }
      <div className='Ite'>
      <div className='Ite-btn'>
        <div className='sub'>
        <a href="/Menu" className="nav-bt" id="nav-btn">Add Items</a>
        </div>     
      </div>
  
    </div>
    </div>
    </div>
} 
      <Footer/>

      </Fragment>
    
  )
}

export default FAV
