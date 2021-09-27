document.addEventListener("turbolinks:load", function() {
  var control = document.querySelector('.indicator-progress')

  if (control) {
  
   var questionsCount = control.dataset.questionsCount
   var questionsIndex = control.dataset.questionsIndex
   var percent = questionsIndex/questionsCount * 100
   control.style.width = percent + "%"
   
}

})
