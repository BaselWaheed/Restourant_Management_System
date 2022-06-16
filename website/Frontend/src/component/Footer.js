import React from "react"
import fac from "../Icons/fac.png"
import go from "../Icons/Go.png"
import inst from "../Icons/inst.png"
import tw from "../Icons/tw.png"


const Footer = () => {
    return(
        <div className='footer'>
            <footer>
                <div  className="box-container">
                    <div className='logo'> 
                        <span className="logo-1">Kale Me Crazy</span>
                    </div>

                    <div  className="contact">
                        <h3  className="title">contact</h3>
                        <p>- lorem ipsum, #239, tricity plaza</p>
                        <p>- Peermuchalla. Zirakpur, Mohali</p>
                        <p>- Telephone: +9199999-88888</p>
                        <p>- E-mail: mail@Babaapp.com</p>
                    </div>

                    <div  className="content">
                        <h3 className="title">content</h3>
                        <p><a href="/Menu" className="menu">- menu</a></p>
                        <p><a href="/Review" className="Reservation">- review</a></p>
                        <p><a href="/About" className="about-us">- about-us</a></p>
                    </div>
                    <div className="follow-us">
                        <h3 className="title">follow-us</h3>
                        <p>
                        <div className='icon-footer'>
                            <img src={fac} alt="fac-icon"/> 
                            <img src={go} alt="gog-icon"/> 
                            <img src={inst} alt="inst-icon"/> 
                            <img src={tw} alt="twe-icon"/> 
                        </div>
                        </p>
                    </div>
                </div>
            </footer>
        </div>
    )
}
export default Footer;