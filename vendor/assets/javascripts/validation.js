jQuery(document).ready(function() {
  jQuery("#sign_up").validate({
errorElement:'div',
rules: {
"user[name]":{
required: true
},

"user[email]":{
required: true,
// remote:"/users/validations/check_email"
},

"user[password]":{
required: true,
},  
"user[password_confirmation]":{
required:true
}
},
messages: {
"user[name]":{
required: "Please enter the name",
remote:"name already exists"
                     },
"user[email]":{
required: "Please enter email address",
remote:"email id already exists"
},
"user[password]":{
required: "Please enter password"
},
"user[password_confirmation]":{
required:"Please enter confirmation password"
}
}
});

jQuery("#log_in").validate({
errorElement:'div',
rules: {
"email":{
required: true
},


"password":{
required: true,
},  
},
messages: {
"email":{
required: "Please enter email address"
                     },
 
"password":{
required: "Please enter password"
}
}
});

jQuery("#forgot-form").validate({
errorElement:'span',
rules: {
 "email" :{
 required: true,
email: true
}
},

messages: {
"email" :{
required: "Please Enter Your Registered Email Address",
email: "Please Enter Valid Email Address"
}
}
 });

$("#change_password").validate({
errorElement:'span',
rules: {
"user[password]":{
required: true,
},
"user[password_confirmation]":{
required: true,
 }
 },
messages: {
"user[password]":{
required: "Please enter current password",
},
"user[password_confirmation]":{
required:"Please enter new password"
 }
}
 });


jQuery("#contactform").validate({
errorElement:'span',
rules: {
"initiative[initiative_category]":{
required: true,
},
"initiative[title]":{
required: true,
},

"initiative[initiative_description]":{
required: true,
},
"initiative[image]":{
required: true,
},
"initiative[country_id]":{
required: true,
},
"initiative[city_id]":{
required: true,
}
},
messages: {
"initiative[initiative_category]":{
required: "Please enter the Category"
                     },
 "initiative[title]":{
required:"Please enter Title"
},   
 
"initiative[initiative_description]":{
required:"Please enter Description"
},
"initiative[country_id]":{
required:"Please select Country"
},
"initiative[city_id]":{
required:"Please select City"
},
"initiative[image]":{
required:"Please Select image"
}   
}
});


jQuery("#contactform1").validate({
errorElement:'span',
rules: {
"city_photo[title]":{
required: true,

},

"city_photo[city_name]":{
required: true,
},
"city_photo[about]":{
required: true,
},
"city_photo[country_id]":{
required: true,
},
"city_photo[city_id]":{
required: true,
},
"city_photo[image]":{
required: true,
}

},
messages: {
"city_photo[title]":{
required: "Please enter Title"

},
 
"city_photo[city_name]":{
required: "Please enter the City Name"

},
"city_photo[about]":{
required: "Please enter the field"
},
"city_photo[country_id]":{
required: "Please select Country"
},
"city_photo[city_id]":{
required: "Please select City"
},
"city_photo[image]":{
required:"Please Select image"
}   
}
});

jQuery("#contactform2").validate({
errorElement:'span',
rules: {
"city_comment[body]":{
required: true,
}

},
messages: {
"city_comment[body]":{
required: "Please enter your comment",

}

}

}); 
jQuery("#contactform3").validate({
errorElement:'span',
rules: {
"comment[body]":{
required: true,
}

},
messages: {
"comment[body]":{
required: "Please enter your comment",

}

}

}); 
jQuery("#new_property").validate({
errorElement:'div',
rules: {
"property[title]" : { required: true },
"property[description]" : { required: true },
"property[address]" : { required: true },
"property[state]": { required: true },
"property[city]": { required: true },
"property[property_category]": { required: true },
"property[bank_id]": { required: true },
"property[age_of_construction]": { required: true },
"property[price_persq]": { required: true },
"property[phone]": { required: true },
"property[trans]": { required: true },
"property[ownership]": { required: true },
"property[facing]": { required: true },
"property[email]": { required: true },
"property[contactperson]": { required: true },
"property[web]": { required: true },
"property[property_class]": { required: true },
"property[land_area]": { required: true },
"property[constructed_area]": { required: true },
"property[floor_number]": { required: true },
"property[bedroom]": { required: true },
"property[bathroom]": { required: true }
},

messages: {
"property[title]":{ required: "Please enter title" },
"property[description]" : { required: "Please enter the description" },
"property[address]" : { required: "Please enter the address" },
"property[state]" : { required: "Please select state" },
"property[city]" : { required: "Please select city" },
"property[property_category]" : { required: "Please select property category" },
"property[bank_id]" : { required: "Please select bank" },
"property[age_of_construction]" : { required: "Please select age of construction" },
"property[price_persq]" : { required: "Please select price per sq" },
"property[phone]" : { required: "Please select phone" },
"property[trans]" : { required: "Please select transaction" },
"property[facing]" : { required: "Please select facing" },
"property[email]" : { required: "Please select email" },
"property[contactperson]" : { required: "Please select contactperson" },
"property[web]" : { required: "Please select web" },
"property[property_class]" : { required: "Please select property class" },
"property[land_area]" : { required: "Please select land area" } ,
"property[constructed_area]" : { required: "Please select constructed area" } ,
"property[floor_number]" : { required: "Please select land area" },
"property[bedroom]" : { required: "Please select bedroom" },
"property[bathroom]" : { required: "Please select bathroom" }
}


});

jQuery("#new_finance").validate({
errorElement:'div',
rules: {
"finance[name]" : { required: true },
"finance[telephone]" : { required: true },

"finance[mobile]": { required: true },
"finance[address]": { required: true },
"finance[city]": { required: true },
"finance[email]": { required: true },
"finance[state]": { required: true },
"finance[loan_amount]": { required: true },
"finance[occupation]": { required: true },
"finance[annual_income]": { required: true },
"finance[loan_duration]": { required: true }
},

messages: {
"finance[name]":{ required: "Please enter name" },
"finance[telephone_residential]" : { required: "Please enter the telephone " },

"finance[mobile]" : { required: "Please enter mobile" },
"finance[address]" : { required: "Please enter address" },
"finance[city]" : { required: "Please enter city" },
"finance[email]" : { required: "Please enter email" },
"finance[state]" : { required: "Please enter company name" },
"finance[loan_amount]" : { required: "Please enter the Loan amount" },
"finance[occupation]" : { required: "Please select your Occupation" },
"finance[annual_income]" : { required: "Please select your annual income" },
"finance[loan_duration]" : { required: "Please select your loan duration" }
}


});




});