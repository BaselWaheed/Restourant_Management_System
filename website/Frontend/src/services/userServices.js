import axios from "axios";
import * as constant from './main';
const endPoint = constant.default.endPoint;

//eslint-disable-next-line import/no-anonymous-default-export
export default{


                            //authorization 
//log in
    onLogin: function(email,password){
        return axios({
            method: 'POST',
        
            url: endPoint +'api/login/',
            data:{
                email:email,
                password:password
            }
        })
    },

//sign up
    onSignUp: function(first_name,last_name,username,email,password,birthdate,is_male,address,phone){
        return axios({
            method: 'POST',
        
            url: endPoint +'api/register/',
            data: {
                first_name:first_name,
                last_name:last_name,
                username:username,
                email:email,
                password:password,
                birthdate:birthdate,
                is_male:is_male,
                address:address,
                phone:phone
            }
        })
    },

//change password
    onChangePass: async function(old_password,new_password,confermation_password){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'POST',
        
            url: endPoint +'api/change-password/',
            headers: {
                "Authorization":myToken
            },
            data:{
                old_password:old_password,
                new_password:new_password,
                confermation_password:confermation_password
            }
        })
    },
//reset password
    onForgetPassword: function(email){
        return axios({
            method: 'POST',
        
            url: endPoint +'api/reset/',
            data:{
                email:email,   
            }
        })
    },

                                        //order
//get order
    myOrder: async function(){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'GET',
            url: endPoint +'order/orderhistory/',
            headers: {
                "Authorization":myToken
            }
        })
    },

//get profile
    userProfile: async function(){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'GET',
            url: endPoint +'info/profile/',
            headers: {
                "Authorization":myToken
            }
        })
    },

//update profile
    userProfileUpdate: async function(email,first_name,last_name,username,birthdate){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'PUT',
            url: endPoint +'info/profile/',
            headers: {
                "Authorization":myToken
            },
            data:{
                first_name:first_name,
                last_name:last_name,
                username:username,
                email:email,
                birthdate:birthdate,
            }
        })
    },

                                                //stuff
/* post reservation */
    onReservation: async function(res_date , res_guest_count , res_time){
    var myToken = await localStorage.getItem('token')
        return axios({
            method: 'POST',
        
            url: endPoint +'staff/reservation/',
            headers: {
                "Authorization":myToken
            },
            data:{
                res_guest_count:res_guest_count,
                res_date:res_date,
                res_time:res_time 
            }
        })
    },


//post review    
onReview: async function(comment){
var myToken = await localStorage.getItem('token')
    return axios({
        method: 'POST',
    
        url: endPoint +'staff/comment/',
        headers: {
            "Authorization":myToken
        },
        data:{
            comment:comment,
        }
    })
},

//get review
    get_review: async function(){
            return axios({
                method: 'GET',
                url: endPoint +'staff/Reviews/',
            })
        },

                                        //product    

//chicken_menu
    chicken_menu: async function(){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'GET',
            url: endPoint +'product/chicken/',
            headers: {
                "Authorization":myToken
            }
        })
    },

//meat_menu
    beef_menu: async function(){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'GET',
            url: endPoint +'product/meet/',
            headers: {
                "Authorization":myToken
            }
        })
    },

//meat_menu
    salad_menu: async function(){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'GET',
            url: endPoint +'product/vegetables/',
            headers: {
                "Authorization":myToken
            }
        })
    },

//drinks_menu
    drinks_menu: async function(){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'GET',
            url: endPoint +'product/drinks/',
            headers: {
                "Authorization":myToken
            }
        })
    },


    /* post searh */
    search_menu: async function(dish_name){
        var myToken = await localStorage.getItem('token')
            return axios({
                method: 'POST',
            
                url: endPoint +'product/search/',
                headers: {
                    "Authorization":myToken
                },
                data:{
                   dish_name:dish_name,
                }
            })
        },

//post_cart
        post_cart: async function(id){
            var myToken = await localStorage.getItem('token')
            return axios({
                method: 'POST',
                url: endPoint +'order/cart/',
                headers: {
                    "Authorization":myToken
                },
                data:{
                    id:id,
                 }
            })
        },
//get_cart
        get_cart: async function(){
            var myToken = await localStorage.getItem('token')
            return axios({
                method: 'GET',
                url: endPoint +'order/cart/',
                headers: {
                    "Authorization":myToken
                }
            })
        }, 
//put_cart
        put_cart: async function(id,quantity){
            var myToken = await localStorage.getItem('token')
            return axios({
                method: 'PUT',
                url: endPoint +'order/cart/',
                headers: {
                    "Authorization":myToken
                },
                data:{
                    id:id,
                    quantity:quantity,
                }
            })
        },


//delet_cart
        delet_cart: async function(id){
            var myToken = await localStorage.getItem('token')
            return axios({
                method: 'DELETE',
                url: endPoint +'order/cart/',
                headers: {
                    "Authorization":myToken
                },
                data:{
                    id:id,
                }
            })
        },




//get_favorite 
        get_favorite: async function(){
            var myToken = await localStorage.getItem('token')
            return axios({
                method: 'GET',
                url: endPoint +'favourite/favouriteDish/',
                headers: {
                    "Authorization":myToken
                }
            })
        },
//post_favorite
        post_favorite: async function(id){
            var myToken = await localStorage.getItem('token')
            return axios({
                method: 'POST',
                url: endPoint +'favourite/favouriteDish/',
                headers: {
                    "Authorization":myToken
                },
                data:{
                    id:id
                }
            })
        },
//check_out delivary
    check_out  : async function(phone,address){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'POST',
            url: endPoint +'order/checkout/',
            headers: {
                "Authorization":myToken
            },
            data:{
                phone:phone,
                address:address
            }
        })
    },

    //check_out tack Away

    check_out_in  : async function(){
        var myToken = await localStorage.getItem('token')
        return axios({
            method: 'GET',
            url: endPoint +'order/checkoutin/',
            headers: {
                "Authorization":myToken
            },
            
        })
    },


}



