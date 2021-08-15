
$(document).ready(function()
{
	
	$("#send").click(function()
	{
		
		var email=$("#email").val();
		var text=$("#text").val();
		
		if(email==''){
			$('#errormail').html('please enter email');
			contactform.email.focus();
			return false;
		}
		else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)))
		{
			$('#errormail').html('please enter valid email');
			contactform.email.focus();
			return false;
		}
		else
		{
			$('#errormail').html('');
		}
		
		
		 if(text==''){
				$('#errortext').html('please enter your message');
				contactform.text.focus();
				return false;
			} 
		 
		else
		{
			$('#errortext').html('');
		}
		
	
				
	});
		
});
		
	
