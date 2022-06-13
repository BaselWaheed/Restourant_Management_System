import React from "react"
import "../App.css"
import Nav from "./Navbar"

import homephoto from '../photo-react/Home.jpg';
import menuHomeph from "../photo-react/menuH.png"
import qout from "../photo-react/qout.jpg"
import rev1 from "../photo-react/rev1.jpg"
import rev2 from "../photo-react/rev2.jpg"
import rev3 from "../photo-react/rev3.jpg"
import Footer from "./Footer";
import img1 from "../photo-react/aboutus.jpg"
import img2 from "../photo-react/images/chicken/Group146.png"
import img3 from "../photo-react/images/drink/Group224.png"
import img4 from "../photo-react/images/drink/Group225.png"
import img5 from "../photo-react/images/meat/Group153.png"
import img6 from "../photo-react/images/meat/Group158.png"
import img7 from "../photo-react/images/salad/Group112.png"
import img8 from "../photo-react/ga1.png"



const Home =() => {
    return(
        <fragment>
        <Nav/>
        <div className='banner'>
            <div className='banner-contain'>
                <div className='container'>
                    <div className='text'>
                        <h3><span>K</span>ale <span>M</span>e <span>c</span>razy  <br/> <span>Resturant</span></h3>
                        <p>We cook our dishes with love for you, and We use the finest ingredients in our food.</p>
                        <div className="about-btn">
                        <a href="/About" className="btn" id="ab">Learn More</a>
                        </div>                                       
                    </div>     
                </div>
                <div className='banner-img'>
                    <img src={homephoto} alt="HOME"/> 
                </div>
            </div>    
        </div>
         {/* home Menu */}
        <div className='/menuhome'>
            <h1 className="heading"><span>Our</span> Menu </h1>
            <div className='menu-contian'>
                <div className='menuh-img'>
                    <img src={menuHomeph} alt="menu"/> 
                </div> 
                <div className='menu-text'>
                    <h3> What do we <span>offer</span>?</h3>
                    <p>Chicken Meals</p>
                    <p>Meat Meals</p>
                    <p> Salad</p>
                    <p> Drinks</p>
                    <div className='btn-menu'>
                        <a href="/Menu" className="btn" id="aboutr">MENU</a>
                    </div> 
                </div>
            </div>
        </div>
         {/* home Gallry*/}
         <div className='gallry-contain'>
         <h1 className="heading">our <span>Gallery</span></h1>
         <div className="gal-con">
            <img src={img8} alt="home" width="300" height="200" />
            <img src={img3} alt="home" width="300" height="200"/>
            <img src={img2} alt="home" width="300" height="200"/>
            <img src={img5} alt="home" width="300" height="200"/>
        </div>
        <div className="gal-con">
            <img src={img7} alt="home" width="300" height="200" />
            <img src={img6} alt="home" width="300" height="200"/>
            <img src={img4} alt="home" width="300" height="200"/>
            <img src={img1} alt="home" width="300" height="200"/>
        </div>
        </div>
        {/* home review */}
        <div className="review1">
            <h1 className="heading">Customer's <span>REVIEW</span></h1>
            <div className='box-container2'>
                <div className="box">
                    <img src={qout} alt="review"/> 
                    <p><span>"</span>Good service and fresh food , it was delicious food.<span>"</span></p>
                    <img src={rev1} alt="review"/> <br/> <br/> 
                    <h3>Ben Jon</h3>
                </div>
                <div className="box">
                    <img src={qout} alt="review"/> 
                    <p><span>"</span>the chicken was perfectly cooked, I will definitely come again.<span>"</span></p>
                    <img src={rev2} alt="review"/> <br/> <br/> 
                    <h3>Julia Moore</h3>
                </div>
                    <div className="box">
                    <img src={qout} alt="review"/> 
                    <p><span>"</span>I had a great time having my meal in this restaurant, the waiters were friendly.<span>"</span></p>
                    <img src={rev3} alt="review"/> <br/> <br/> 
                    <h3>Tom Reeves</h3>
                </div>
            </div>
        </div>
        <Footer/>
        </fragment>
    )
}
export default Home