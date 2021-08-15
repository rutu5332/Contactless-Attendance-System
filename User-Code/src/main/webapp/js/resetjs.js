$(document).ready(function()
{
	$("#submit").click(function()
	{
		var otp=$("#otp").val();
		var code=$("#code").val();
		var npsw=$("#password").val();
		var cpsw=$("#cpassword").val();
		var re = /[0-9]+/;
		var re2 = /[a-z]+/;
		var re3 = /[A-Z]+/;
		
		 if(otp==''){
			$('#errorotp').html('please enter code');
			resetform.otp.focus();
			return false;
		}
		 else if(otp != code){
			 $('#errorotp').html('Invalid Code!');
				resetform.otp.focus();
				return false;
		 }
		 else
		{
				$('#errorotp').html('');
		}
		 
		 if(npsw==''){
				$('#errorpswd').html('please enter new password');
				resetform.password.focus();
				return false;
			}
		else if((npsw.length)<8)
		{
			$('#errorpswd').html('minimum 8 characters required');
			resetform.password.focus();
			return false;
		}
	   	else if(!re.test(npsw)) 
	  	{
	   		$('#errorpswd').html('at least one number(0-9) required');
		        resetform.password.focus();
		        return false;
    	}
	      	
	      	
	    else if(!re2.test(npsw)) 
	  	{
	    	$('#errorpswd').html('at least one lowercase letter(a-z) required');
	    	resetform.password.focus();
		        return false;
		 }
	      	
	    else if(!re3.test(resetform.password.value)) 
	  	{
	    	$('#errorpswd').html('at least one uppercase letter(A-Z) required');
	    	resetform.password.focus();
	        	return false;
    	}
		else
		{
			$('#errorpswd').html('');
		}
		 
		if(cpsw=='')
		{
			$('#errorcpsw').html('please enter confirm password');
			resetform.cpassword.focus();
			return false;
		}
		else if(npsw!=cpsw)
		{
			$('#errorcpsw').html("password mismatch");
			resetform.cpassword.focus();
			return false;
		}
		else
		{
			$('#errorcpsw').html('');
		}
		
		
	});
		
});
		
	
