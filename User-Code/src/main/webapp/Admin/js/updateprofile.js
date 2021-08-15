$(document).ready(function()
{
	$("#changes").click(function()
	{
		
		var fnm=$("#fname").val();
		var lnm=$("#lname").val();
		var mail=$("#mail").val();
		var des=$("#des").val();
		var mno=$("#mno").val();
		
		 if(fnm=='')
		 {
			$('#fnm').html('please enter first name');
			update.fname.focus();
			return false;
		}
		 else
		{
			$('#fnm').html('');
		}
		 
		 if(lnm=='' )
		 {
			$('#lnm').html('please enter last name');
			update.lname.focus();
			return false;
		}
		 else
		{
			$('#lnm').html('');
		}
		 
		 if(mail=='' )
		 {
			$('#mail').html('please enter email');
			update.mail.focus();
			return false;
		}
		 else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)))
			{
			 $('#mail').html('please enter email');
				update.mail.focus();
				return false;
			}
		 else
		{
			$('#mail').html('');
		}		
		 
		 if(des=='')
		 {
			$('#des').html('please enter designation');
			update.des.focus();
			return false;
		}
		 else
		{
			$('#des').html('');
		}
		 
		 if(mno=='' )
		 {
			$('#mno').html('please enter mobile number');
			update.mno.focus();
			return false;
		}
		 else
		{
			$('#mno').html('');
		}
		 
	});
		
});
		
	
