document.addEventListener("turbolinks:load", function() {
  var control = document.getElementById('user_password_confirmation')
control.addEventListener('input', passwordСonfirmation)

})

function passwordСonfirmation(){
  var pass1 = document.getElementById("user_password").value;
  var pass2 = document.getElementById("user_password_confirmation").value;

  if (pass2 == ''){
    document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    document.querySelector('.octicon-x-circle-fill').classList.add('hide')
    return
  }

if (pass1 == pass2){
    document.querySelector('.octicon-check-circle-fill').classList.remove('hide')
    document.querySelector('.octicon-x-circle-fill').classList.add('hide')
  } else{
    document.querySelector('.octicon-check-circle-fill').classList.add('hide')
    document.querySelector('.octicon-x-circle-fill').classList.remove('hide')
  }
  
}


