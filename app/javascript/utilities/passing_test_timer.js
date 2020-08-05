document.addEventListener('turbolinks:load', function () {
    let dedLine = gon.ded_line;
    if (document.querySelector('.timer')) {setClock('.timer', dedLine)}

    function getTimeRemaining(endtime) {
        let t = endtime - Date.parse(new Date()),
            minutes = Math.floor((t/1000/60) % 60),
            seconds = Math.floor((t/1000) % 60);

        return {
            'total': t,
            'minutes': minutes,
            'seconds': seconds
        };
    }

    function setClock(id, endtime) {
        let timer = document.querySelector(id),
            minutes = timer.querySelector('.minutes'),
            seconds = timer.querySelector('.seconds'),
            timeInterval = setInterval(updateClock, 1000);

        function  infoUser() {
            timer.classList.add('hide');
            document.querySelector('.info-user').classList.remove('hide')
        }

        function updateClock() {
            let t = getTimeRemaining(endtime);
            if (t.total <= 0 ) {
                clearInterval(timeInterval);
                infoUser();
                setTimeout(function() {
                    window.location.href = gon.result;
                    return 0;
                }, 2000);

            }
            if ((String(t.minutes).length) <= 1) {
                minutes.textContent = ('0' + t.minutes);
            } else {
                minutes.textContent = t.minutes;
            }

            if ((String(t.seconds).length) <= 1) {
                seconds.textContent = ('0' + t.seconds);
            } else {
                seconds.textContent = t.seconds;
            }
        }
    }
});
