
$(document).ready(function()
{
	
	$("#login").click(function()
	{
		
		var email=$("#email").val();
		var psw=$("#password").val();
		
		if(email==''){
			$('#errormail').html('please enter email');
			loginform.email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			$('#errormail').html('please enter valid email');
			loginform.email.focus();
			return false;
		}
		else
		{
			$('#errormail').html('');
		}
		
		
		 if(psw==''){
				$('#errorpswd').html('please enter password');
				loginform.password.focus();
				return false;
			} 
		 
		else
		{
			$('#errorpswd').html('');
		}
		
	
				
	});
		
});
		
	
