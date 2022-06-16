import React,{Fragment} from "react"
import Nav from "./Navbar"
import aboutphoto from "../photo-react/aboutus.jpg"
import Footer from "./Footer"

const About = () => {
    return(
        <Fragment>
        <Nav/>
        <div className='about'>
        <div className='about-contian'>
            <div className='about-img'>
                <img src={aboutphoto} alt="aboutUs-img"/> 
            </div> 
            <div className='about-text'>
                <h3> What make our <span>special</span>?</h3>
                <p>Is a healthy food resturant, serves high quality food using fresh food hand picked ingredients from finest markets to meet customers needs.</p>
                
            </div>
            <Footer/>

        </div>
      
        
    </div>
    </Fragment>
    )
}

export default About;