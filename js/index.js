$(function() {
  $("form[name='registration']").validate({
    rules: {
      firstname: "required",
      lastname: "required",
      altno: "required",
      txtDateOfJoining: "required",
      bill: "required",
      voucher: "required",
      user_id: "required",
      emp_id: "required",
      empName: "required",
      month: "required",
      employeeid: "required",
      house_rent: "required",
      bank_name: "required",
      conveyance: "required",
      acc_no: "required",
      pancard_no: "required",
      tax: "required",
      salary: {
        required: true,
        number: true
      },
       amount: {
        required: true,
        number: true
      },
      email: {
        required: true,
        email: true
      },
      age: {
        required: true,
        number: true,
      },
      number: {
        required: true,
        number: true,
        minlength:10
      },
       altno: {
        required: true,
        number: true,
        minlength:10
      },
      
      password: {
        required: true,
        minlength: 5
      }
    },
    messages: {
      pancard_no:"Enter pancard no",
      tax:"Enter Tax",
      acc_no:"Enter Account number",
      conveyance:"Enter Conveyance allowance",
      bank_name:"Enter bank name",
      house_rent:"Enter house rent",
      employeeid: "Enter Employee Id",
      month: "Choose month Name",
      empName: "Enter Employee Name",
       user_id: "Enter Employee Id",
       emp_id: "Enter Employee Id",
      voucher: "Enter Voucher No",
      amount: "Enter Amount",
      bill: "Enter Bill No",
      firstname: "Please enter your Name",
      lastname: "Please enter your lastname",
      number: "Please enter 10 digit Mobile Number",
      age: "Please Age Like 45",
      txtDateOfJoining: "Choose a Date First",
      salary: "Please salary Amount",
      number: {
        required: "Please enter 10 digit Mobile Number",
        minlength: "Number Should be 10 digit"
      },
      altno: {
        required: "Please enter 10 digit Mobile Number",
        minlength: "Number Should be 10 digit"
      },
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
      email: "Please enter a valid email address"
    },
    submitHandler: function(form) {
      form.submit();
    }
  });
});