import {log} from './logging.js'

function createCallback(fnCallBack) {
    return function (position) {
        const latitude = position.coords.latitude
        const longitude = position.coords.longitude

        log.info('You are located at Lat, Long (' + latitude + ', ' + longitude + ')')
        fnCallBack(latitude, longitude)
    }
}

function error() {
    log.error('Could not retrieve location')
}

function calculateGeoCode(fnCallBack) {
        log.info('Calculating geocode...')

        if (!navigator.geolocation) {
            log.error("Browser Does Not Support geolocation")
        } else {
            navigator.geolocation.getCurrentPosition(
                createCallback(fnCallBack),
                error,
                {enableHighAccuracy: true})
        }
}


export {calculateGeoCode}
