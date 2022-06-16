import React,{Fragment ,useEffect, useState} from 'react'
import Footer from '../component/Footer'
import Nav from "../component/Navbar"
import { useNavigate  } from "react-router-dom";
import { BsBasket3Fill } from "react-icons/bs";
import * as userServices from '../services/userServices';
import { toast } from "react-toastify";


const userService = userServices.default
const Cart = () => {

  const [data,setData] = useState([])
  const [total,setTotal] = useState("")
  const[quantity,setquantity]= useState(0)

  const history = useNavigate ();

  useEffect(()=>{
    getData();
  },[total])
  function getData(){
    userService.get_cart().then((res)=>{
      setData(res.data.data.cart_item);
      setTotal(res.data.data.total_price)
      console.log("res",res.data.data)
    })
  }

                                    //put_cart & delete_cart

  function change_quantity(id){
    userService.put_cart(id,quantity).then((res)=>{
        console.log(res.data)
        setTotal(res.data.data.total_price)
    })
  }

  function tack_away(){
    userService.check_out_in().then((res)=>{
      history("/Home");
        toast.success("order will be ready after 20 minutes ", {
        position: toast.POSITION.TOP_LEFT,
        autoClose: 8000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
      });
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


function delete_item(id){
      userService.delet_cart(id).then((res)=>{
          console.log(res.data)
          getData()
          toast.success("removed to cart", {
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

    {/* empty cart */}
{
       data.length ===0?
       <div className='cart-item1'>
       <h1 className="heading">Your<span>Cart</span></h1>
       <div className='items1'>
         <p className='icons-cart'><BsBasket3Fill/></p>
         <p className='text-cart'>Your cart is empty!</p><br/>
 
       </div>
       <a href="/Menu" className="btn" >check product</a>
 
    </div>
    :

    <div className='cart-item'>
    <h1 className="heading">Your<span>Cart</span></h1>
    <div className='items'>
      
      
    <div className='items-te'>
      <p>product</p>
      <p>Name</p>
      <p>Quantity</p>
      <p>Remove</p>
      <p>Price</p>
    </div>
  

    {
    data.map((item)=>{
      return (
        <Fragment>
        <div className='items-te'>
        <div className='items-cart'>
        <img src={item.dish.dish_image} alt="items-cart" width="170" height="150" style={{'borderRadius':'8px'}}/>
        </div>        
        <p className='items-bt'>{item.dish.dish_name}</p>
        <div className='items-btss'>
        <input className="table"
        onChange={(e)=>setquantity(e.target.value)}
        type="number"  
        min="0" max="100"
        placeholder={item.quantity}
        value={item.quantity}
        onClick={()=>change_quantity(item.id)}
          />
        </div>
        <div className='items-bts'>
        <button type="submit" className="nav-btns" onClick={()=>delete_item(item.id)}>x</button>
        </div>
        <div className='items-bts'>
          <h4>{item.price}</h4>
        </div>
        </div>
        </Fragment>
      )
          
    })
    }
{/*             --------------------------                */}

       
           <div className='DE-SU'>
           <div className='DE'>
           <label>SubTotel:</label>
           <label>{total} L.E</label>
           </div>
           <div className='DE'>
           <label>delivery:</label>
           <label>30 L.E</label>
           </div>
           <div className='DE'>
           <label>Total:</label>
           <label>{total + 30} L.E</label>
           </div>
           </div>
           

     <div className='Ite'>
       <div className='Ite-btn'>
         <div className='sub'>
         <a href="/Menu" className="nav-bt" id="nav-btn">Add Product</a>
         </div>&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 
         
        <button className="nav-btt"
        id="Submit"
        onClick={()=>tack_away()}
        >In Resturant</button>

         <div className='sub'>
         <a href="/CheakOut" className="nav-bt" id="nav-btn">delivery</a>
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

export default Cart
