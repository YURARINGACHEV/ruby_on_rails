document.addEventListener("turbolinks:load", function() {
  var control = document.querySelector('.indicator-progress')
  var submit = document.querySelector('.submit_progress')
  if (submit) {  
    var questionsCount = control.dataset.questionsCount
   var questionsIndex = control.dataset.questionsIndex
   var percent = questionsIndex/questionsCount * 100
    
}
  control.style.width = percent + "%"
})

