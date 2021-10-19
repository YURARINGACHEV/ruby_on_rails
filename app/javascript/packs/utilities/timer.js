document.addEventListener('turbolinks:load', function(){
    let timerValue = document.querySelector('.timer')

    const time = timerValue.dataset.remainingTime;
    startTimer(timerValue, time);
})

function startTimer(control, time) {
    if (time > 0) {
        let timerLabel = document.querySelector('.timer_label');
        timerLabel.textContent = format(time);
        time--;
        setTimeout(startTimer, 1000, control, time);
    } 
}

function format(number) {
    let seconds = number % 60
    const minutes = (number - seconds) / 60

    if (seconds < 10) {
        seconds = '0' + seconds
    }

    return minutes + ':' + seconds
}