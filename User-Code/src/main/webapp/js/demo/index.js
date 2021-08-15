var image=["s3" , "s2" , "s1" , "s4" ];
i=image.length;
function nxt()
{
	if (i<image.length)
	{
		i=i+1;
	}
	else
	{
		i=1;
	}
	document.getElementById('slide').innerHTML="<img src=\"img/"+image[i-1]+".jpg\">";
}
function prew()
{
	if (i<image.length+1 && i>1)
	{
		i =i-1;
	}
	else
	{
		i=image.length;
	}
	document.getElementById('slide').innerHTML="<img src=\"img/"+image[i-1]+".jpg\">";
}
setInterval(nxt,3000);