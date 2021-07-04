function checkPassword()
{
	pass1 = document.updateForm.pass1.value;
	pass2 = document.updateForm.pass2.value;
	
	if (pass1 == pass2)
	{
		document.getElementById('msg').innerHTML = "Password Matched";
		document.getElementById('msg').style.color = "blue";
	}
	else
	{
		document.getElementById('msg').innerHTML = "Password Not Matched";
		document.getElementById('msg').style.color = "red";
	}
}