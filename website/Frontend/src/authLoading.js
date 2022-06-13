import React, { useEffect } from 'react';
import { useNavigate } from "react-router-dom";

function AuthLoading() {
    const history = useNavigate();


    useEffect(() => {

        var isloggedin = localStorage.getItem('LoggedIn');
        var firstVisit = localStorage.getItem('firstVisit');

        if (firstVisit == null) {
            localStorage.setItem('firstVisit', 'false')
            history("/login");
        }
        else
          {
            if (isloggedin === 'true') {
                history("/Home");
            }
            else {
                history("/Login");
            }
          }
    }, [history])



    return (
        <div>

        </div>
    )
}

export default AuthLoading






