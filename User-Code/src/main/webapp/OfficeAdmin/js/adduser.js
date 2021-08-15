
$(document).ready(function()
{ 
	// on blur functions
	$("#fname").blur(function(){
		var finame=$("#fname").val().trim();	
		var re = /^[a-zA-Z ]*$/;
		
		if(finame == ""){
			$("#fname-error").html("* First name is required.");
			$('#fname').css('border', '1px solid red');
			return false;
		}
		else if(!re.test(finame)) 
		{
			$("#fname-error").html("* First name contains only letters.");
			$('#fname').css('border', '1px solid red');
			return false;
		}
		else{
			$("#fname-error").html("");
			$('#fname').css('border-color', '');
		}
	});
	
	$("#lname").blur(function(){
		var laname=$("#lname").val().trim();
		var re = /^[a-zA-Z ]*$/;
		
		if(laname == ""){
			$("#lname-error").html("* Last name is required.");
			$('#lname').css('border', '1px solid red');
			return false;
		}
		else if(!re.test(laname)) 
		{
			$("#lname-error").html("* Last name contains only letters.");
			$('#lname').css('border', '1px solid red');
			return false;
		}
		else{
			$("#lname-error").html("");
			$('#lname').css('border-color', '');
		}
	});
	
	$("#email").blur(function(){
		var mail = $("#email").val().trim();
		
		if(mail==''){
			$('#email-error').html('* Email is Required.');
			$('#email').css('border', '1px solid red');
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)))
		{
			$('#email-error').html('* Please enter valid email id');
			$('#email').css('border', '1px solid red');
			return false;
		}
		else
		{
			$('#email-error').html('');
			$('#email').css('border-color', '');
		}
	});
	
	$("#mob").blur(function(){
		var mno = $("#mob").val().trim();
		
		if(mno==''){
			$('#mob-error').html('* Mobile Number is Required.');
			$('#mob').css('border', '1px solid red');
			return false;
		}
		else if(mno.length < 10 || mno.length > 10)
		{
			$('#mob-error').html('* Please enter 10 digits');
			$('#mob').css('border', '1px solid red');
			return false;
		}
		else if(isNaN(mno)) 
		{
			$('#mob-error').html('* Phone number only contain numbers');
			$('#mob').css('border', '1px solid red');
      		return false;
		}
		else
		{
			$('#mob-error').html('');
			$('#mob').css('border-color', '');
		}
	});
	
	$("#user").blur(function(){
		var utype =$("#user").val();
		
		if(utype == 0){
			$("#user-error").html("* Please Select User Type.");
			$('#user').css('border', '1px solid red');
			return false;
		}
		else{
			$('#user-error').html('');
			$('#user').css('border-color', '');
		}
	});
	
	$("#user").change(function(){
		var utype =$("#user").val();
		if(utype == 1){
			$("#des").val("Admin");
			$("#des").prop("disabled", true);
		}
		else if(utype == 2){
			$("#des").val("Office Admin");
			$("#des").prop("disabled", true);
		}
		else{
			$("#des").val("");
			$("#des").prop("disabled", false);
		}
	});
	
	$("#des").blur(function(){
		var desi =$("#des").val();
		
		if(desi == ""){
			$("#des-error").html("* Please Select Designation.");
			$('#des').css('border', '1px solid red');
			return false;
		}
		else{
			$('#des-error').html('');
			$('#des').css('border-color', '');
		}
	});
	
	//on submit
	$("#addUser").click(function()
	{
		var utype =$("#user").val();
		var finame=$("#fname").val().trim();
		var laname=$("#lname").val().trim();
		var mail = $("#email").val().trim();
		var mno = $("#mob").val().trim();
		var desi =$("#des").val();
		var gen =$('input[name="gen"]:checked').val();
		
		
		if(utype == 0){
			$("#user-error").html("* Please Select User Type.");
			$('#user').css('border', '1px solid red');
			AddUserForm.user.focus();
			return false;
		}
		else{
			$('#user-error').html('');
			$('#user').css('border-color', '');
		}
		
		var re = /^[a-zA-Z ]*$/;
		if(finame == ""){
			$("#fname-error").html("* First name is required.");
			$('#fname').css('border', '1px solid red');
			AddUserForm.fname.focus();
			return false;
		}
		else if(!re.test(finame)) 
		{
			$("#fname-error").html("* First name contains only letters.");
			$('#fname').css('border', '1px solid red');
			AddUserForm.fname.focus();
			return false;
		}
		else{
			$("#fname-error").html("");
			$('#fname').css('border-color', '');
		}
		
		if(laname == ""){
			$("#lname-error").html("* Last name is required.");
			$('#lname').css('border', '1px solid red');
			AddUserForm.lname.focus();
			return false;
		}
		else if(!re.test(laname)) 
		{
			$("#lname-error").html("* Last name contains only letters.");
			$('#lname').css('border', '1px solid red');
			AddUserForm.lname.focus();
			return false;
		}
		else{
			$("#lname-error").html("");
			$('#fname').css('border-color', '');
		}
		
		if(gen == undefined){
			$('#gen-error').html('* Please select Gender.');
			return false;
		}
		else{
			$('#gen-error').html('');
		}
		
		if(mail==''){
			$('#email-error').html('* Email is Required.');
			$('#email').css('border', '1px solid red');
			AddUserForm.email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)))
		{
			$('#email-error').html('* Please enter valid email id');
			$('#email').css('border', '1px solid red');
			AddUserForm.email.focus();
			return false;
		}
		else
		{
			$('#email-error').html('');
			$('#email').css('border-color', '');
		}
		
		if(mno==''){
			$('#mob-error').html('* Mobile Number is Required.');
			$('#mob').css('border', '1px solid red');
			AddUserForm.mob.focus();
			return false;
		}
		else if(mno.length < 10 || mno.length > 10)
		{
			$('#mob-error').html('* Please enter 10 digits');
			$('#mob').css('border', '1px solid red');
			AddUserForm.mob.focus();
			return false;
		}
		else if(isNaN(mno)) 
		{
			$('#mob-error').html('* Phone number only contain numbers');
			$('#mob').css('border', '1px solid red');
			AddUserForm.mob.focus();
      		return false;
		}
		else
		{
			$('#mob-error').html('');
			$('#mob').css('border-color', '');
		}
		
		if(desi == ""){
			$("#des-error").html("* Please Select Designation.");
			$('#des').css('border', '1px solid red');
			AddUserForm.des.focus();
			return false;
		}
		else{
			$('#des-error').html('');
			$('#des').css('border-color', '');
		}
		
		var img=$('#img1').val();
		var ext=img.substr(img.indexOf('.')+1);
		if(img == ""){
			$("#img1-error").html("* Please Select Image.");
			$('#img1').css('border', '1px solid red');
			AddUserForm.img1.focus();
			return false;
		}
		else if(!(ext == "jpeg" || ext == "jpg" )){
			$("#img1-error").html("* Please Select jpeg/jpg Images.");
			$('#img1').css('border', '1px solid red');
			AddUserForm.img1.focus();
			return false;
		}
		else{
			$('#img1-error').html('');
			$('#img1').css('border-color', '');
		}
		
		var img=$('#img2').val();
		var ext=img.substr(img.indexOf('.')+1);
		if(img == ""){
			$("#img2-error").html("* Please Select Image.");
			$('#img2').css('border', '1px solid red');
			AddUserForm.img2.focus();
			return false;
		}
		else if(!(ext == "jpeg" || ext == "jpg" )){
			$("#img2-error").html("* Please Select jpeg/jpg Images.");
			$('#img2').css('border', '1px solid red');
			AddUserForm.img2.focus();
			return false;
		}
		else{
			$('#img2-error').html('');
			$('#img2').css('border-color', '');
		}
		
		var img=$('#img3').val();
		var ext=img.substr(img.indexOf('.')+1);
		if(img == ""){
			$("#img3-error").html("* Please Select Image.");
			$('#img3').css('border', '1px solid red');
			AddUserForm.img3.focus();
			return false;
		}
		else if(!(ext == "jpeg" || ext == "jpg" )){
			$("#img3-error").html("* Please Select jpeg/jpg Images.");
			$('#img3').css('border', '1px solid red');
			AddUserForm.img3.focus();
			return false;
		}
		else{
			$('#img3-error').html('');
			$('#img3').css('border-color', '');
		}
	});
});