const input=document.getElementById("to");
const addbtn=document.getElementById("fa");
const todoList=document.getElementById("elements");
const deleteallbtn=document.getElementById("deleteall");

input.onkeyup =()=>{
	let userData=input.value;
	if(userData.trim()!=0)
	{
		addbtn.classList.add("active");
	}
	else
	{
		addbtn.classList.remove("active");
	}
}

function submitForm() {                
    document.forms[0].submit();
    return true;
}
